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

  describe '#take_hit' do
    it 'Increases the ship hits attribute by 1' do
      expect { subject.take_hit }.to change { subject.hits }.by(1)
    end
  end

  describe '#destroyed?' do
    it 'Returns false' do
      expect(subject.destroyed?).to eq(false)
    end

    it 'Returns true' do
      3.times { subject.take_hit }
      expect(subject.destroyed?).to eq(true)
    end
  end

  context 'The battleship is a Carrier' do
    let(:subject) { Battleship.carrier }

    describe '#size' do
      it 'Returns 5' do
        expect(subject.size).to eq(5)
      end
    end
  end

  context 'The battleship is a Battleship' do
    let(:subject) { Battleship.battleship }

    describe '#size' do
      it 'Returns 4' do
        expect(subject.size).to eq(4)
      end
    end
  end

  # context 'The battleship is a Battleship' do
  #   let(:subject) { Battleship.battleship }
  #
  #   describe '#size' do
  #     it 'Returns 4' do
  #       expect(subject.size).to eq(4)
  #     end
  #   end
  # end
end
