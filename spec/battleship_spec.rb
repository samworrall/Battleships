require 'battleship'

describe Battleship do
  let(:subject) { Battleship.new(3) }
  describe '#size' do
    it 'Returns the specified size of the battleship' do
      expect(subject.size).to eq(3)
    end
  end

  describe '#hits' do
    it 'Returns the number of times the ship has been hit, starts at 0' do
      expect(subject.hits).to eq(0)
    end
  end
end
