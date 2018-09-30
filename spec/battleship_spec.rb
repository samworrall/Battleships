require 'battleship'

describe Battleship do
  let(:subject) { Battleship.new(3) }
  describe '#size' do
    it 'Returns the specified size of the battleship' do
      expect(subject.size).to eq(3)
    end
  end
end
