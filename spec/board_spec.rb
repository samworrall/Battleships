require 'board'

describe Board do
  let(:subject) { Board.new(cell_class) }
  let(:cell_class) { spy :cell_class, new: cell }
  let(:cell) { double :cell, content: ocean, :content= => nil }
  let(:ocean) { double :ocean }
  let(:battleship) { double :battleship, size: 3 }

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
      expect(cell_class).to have_received(:new).exactly(100).times
    end
  end

  describe '#place_ship', :place_ship do
    it 'Takes 3 arguments' do
      expect(subject).to respond_to(:place_ship).with(3).arguments
    end

    it 'calls content= on cell 3 times for a ship of size 3 placed vertically' do
      subject.construct_grid
      subject.place_ship("A1", battleship, "vertical")
      expect(cell).to have_received(:content=).with(battleship).exactly(3).times
    end

    it 'calls content= on cell 3 times for a ship of size 3 placed horizontally' do
      subject.construct_grid
      subject.place_ship("A1", battleship, "horizontal")
      expect(cell).to have_received(:content=).with(battleship).exactly(3).times
    end

    it 'Throws an error if the orientation is not specified correctly' do
      subject.construct_grid
      expect { subject.place_ship("A1", battleship, "horizontally") }
      .to raise_error("Orientation must either be vertical or horizontal")
      expect { subject.place_ship("A1", battleship, "vertically") }
      .to raise_error("Orientation must either be vertical or horizontal")
    end

    it 'Throws an error if there is not enough space to place ship vertically' do
      subject.construct_grid
      expect { subject.place_ship("J1", battleship, "vertical") }
      .to raise_error("There is not enough space for this ship here")
    end

    it 'Throws an error if there is not enough space to place ship horizontally' do
      subject.construct_grid
      expect { subject.place_ship("A9", battleship, "horizontal") }
      .to raise_error("There is not enough space for this ship here")
    end
  end
end
