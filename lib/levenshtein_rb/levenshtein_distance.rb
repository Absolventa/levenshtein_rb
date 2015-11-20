module LevenshteinRb
  class LevenshteinDistance

    # Ruby implementation of
    # Levenshtein distance algorithm
    # that measures the similarity of
    # two strings.
    #
    # Highly inspired by:
    # http://rosettacode.org/wiki/Levenshtein_distance#Ruby

    # A demonstration; the table of numbers is the
    # "recurrence matrix". ε means the "empty word".
    #
    #    | ε T o r
    #  -----------
    #  ε | 0 1 2 3
    #  T | 1 0 1 2
    #  i | 2 1 1 2
    #  e | 3 2 2 2
    #  r | 4 3 3 2
    #            ↑
    #          This last value is the Levenshtein distance

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
      # If one of the strings is empty,
      # and the other string has length n
      # it takes exactly n steps to "build"
      # this string starting with the empty
      # word
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

    def costs_for_step(i, j)
      # Determines the costs to turn
      # the word s[0..i] into the word t[0..j]
      # using previously computes values
      # stored in recurrence matrix

      if same_character_for_both_words_is_added?(i, j)
        # No Operation required, take the previous value
        # of the subwords without current character.
        d[i-1][j-1]
      else
        [
          d[i-1][j]   + 1, # Look left in the matrix. This would be a "deletion". It costs +1.
          d[i][j-1]   + 1, # Look directly above the current entry in matrix. This would correspond to an insertion which costs +1
          d[i-1][j-1] + 1, # Completely substitute the character, this also costs +1
        ].min
      end
    end

  end
end
