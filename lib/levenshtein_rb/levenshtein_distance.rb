module LevenshteinRb
  class LevenshteinDistance

    class RecurrenceMatrix

      attr_reader :store

      def [](index)
        store[index]
      end

      def []=(index, value)
        store[index] = value
      end

      def initialize(m, n)
        @store = Array.new(m+1) { Array.new(n+1) }

        (0..m).each { |i| store[i][0] = i }
        (0..n).each { |j| store[0][j] = j }
      end

    end

    attr_reader :s, :t, :m, :n, :d

    def initialize(a_string, another_string)
      @s, @t = a_string, another_string
      @m, @n = s.length.to_i, t.length.to_i
      @d     = RecurrenceMatrix.new(m, n) # d is simply the default notation for a recurrence matrix in literature
    end

    def to_i
      return m if n == 0
      return n if m == 0

      (1..n).each do |j|
        (1..m).each do |i|
          d[i][j] = costs_for_step(i, j)
        end
      end

      d[m][n]
    end


    private

    def same_character_for_both_words_is_added?(i, j)
      s[i-1] == t[j-1]
    end

    def obtain_minimal_value_from_neighbors(i, j)
      [
        d[i-1][j], # Look left in the matrix. This would be a "deletion". It costs + 1 more than d[i-1][j]]
        d[i][j-1], # Look directly above the current entry in matrix. This would correspond to an insertion which costs +1 additionally
        d[i-1][j-1], # Completely substitute the character, this also costs +1 more  than d[j-1, i-1]
      ].min
    end

    def costs_for_step(i, j)
      if same_character_for_both_words_is_added?(i, j)
        d[i-1][j-1]
      else
        obtain_minimal_value_from_neighbors(i, j) + 1
      end
    end

  end
end
