require 'player'

describe Player do
  let(:subject) { Player.new(ship_class, board_class) }
  let(:ship_class) { double :ship_class, carrier: carrier, battleship: battleship,
                     cruiser: cruiser, submarine: submarine, destroyer: destroyer }
  let(:board_class) { double :board_class, new: board }
  let(:board) { double :board }
  let(:carrier) { double :carrier, size: 5, placed?: false, destroyed?: false }
  let(:battleship) { double :battleship, size: 4, placed?: false, destroyed?: false }
  let(:cruiser) { double :cruiser, size: 3, placed?: false, destroyed?: false }
  let(:submarine) { double :submarine, size: 3, placed?: false, destroyed?: false }
  let(:destroyer) { double :destroyer, size: 2, placed?: false, destroyed?: false }


  describe '#fleet', :fleet do
    it 'Returns an empty hash upon initialisation' do
      expect(subject.fleet).to be_empty
      expect(subject.fleet).to eq({})
    end
  end

  describe '#construct_fleet', :construct_fleet do
    it 'Increases the length of fleet array by 5' do
      expect { subject.construct_fleet }.to change {subject.fleet.length }.by(5)
    end
  end

  describe '#board', :player_board do
    it 'Returns the player board' do
      expect(subject.board).to eq(board)
    end
  end

  describe '#fleet_placed?', :fleet_placed? do
    it 'Returns false' do
      subject.construct_fleet
      expect(subject.fleet_placed?).to eq(false)
    end
  end

  describe '#fleet_destroyed?', :fleet_destroyed? do
    it 'Returns false' do
      subject.construct_fleet
      expect(subject.fleet_destroyed?).to eq(false)
    end
  end

  context 'All ships are placed' do
    let(:carrier) { double :carrier, placed?: true }
    let(:battleship) { double :battleship, placed?: true }
    let(:cruiser) { double :cruiser, placed?: true }
    let(:submarine) { double :submarine, placed?: true }
    let(:destroyer) { double :destroyer, placed?: true }

    describe '#fleet_placed?', :fleet_placed? do
      it 'Reuturns true' do
        subject.construct_fleet
        expect(subject.fleet_placed?).to eq(true)
      end
    end
  end

  context 'All ships in fleet are destroyed' do
    let(:carrier) { double :carrier, destroyed?: true }
    let(:battleship) { double :battleship, destroyed?: true }
    let(:cruiser) { double :cruiser, destroyed?: true }
    let(:submarine) { double :submarine, destroyed?: true }
    let(:destroyer) { double :destroyer, destroyed?: true }

    describe '#fleet_destroyed?', :fleet_destroyed? do
      it 'Returns true' do
        subject.construct_fleet
        expect(subject.fleet_destroyed?).to eq(true)
      end
    end
  end
end
