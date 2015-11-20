require 'spec_helper'

RSpec.describe LevenshteinRb::LevenshteinDistance do

  describe '#to_i' do
    it { expect(described_class.new('', '').to_i).to eql 0 }

    context 'with insertion/deletion' do
      it { expect(described_class.new('', 'a').to_i).to eql 1 }
      it { expect(described_class.new('a', '').to_i).to eql 1 }

      it { expect(described_class.new('bbb', 'bbba').to_i).to eql 1 }
      it { expect(described_class.new('bbba', 'bbb').to_i).to eql 1 }
    end

    context 'with substitution' do
      it { expect(described_class.new('a', 'b').to_i).to eql 1 }
      it { expect(described_class.new('ba', 'bb').to_i).to eql 1 }
      it { expect(described_class.new('ab', 'bb').to_i).to eql 1 }
    end

    context 'with case studies' do
      it { expect(described_class.new('Tier', 'Tor').to_i).to eql 2 }
    end

  end
end
