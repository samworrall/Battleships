require 'board'

describe Board do
  let(:subject) { Board.new(cell) }
  let(:cell) { spy :cell }

  describe '#grid', :grid do
    it 'Returns an empty hash upon initialisation' do
      expect(subject.grid).to eq({})
      expect(subject.grid).to be_empty
    end
  end

  describe '#construct_grid', :construct do
    it 'Pushes A1 - J10 to the grid hash' do
      subject.construct_grid
      expect(subject.grid.length).to eq(100)
    end

    it 'Calls new on Cell 100 times' do
      subject.construct_grid
      expect(cell).to have_received(:new).exactly(100).times
    end
  end
end
