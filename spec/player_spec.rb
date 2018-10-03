require 'player'

describe Player do
  let(:subject) { Player.new(ship_class, board_class) }
  let(:ship_class) { double :ship_class, carrier: carrier, battleship: battleship,
                     cruiser: cruiser, submarine: submarine, destroyer: destroyer }
  let(:board_class) { double :board_class, new: board }
  let(:board) { double :board }
  let(:carrier) { double :carrier, size: 5 }
  let(:battleship) { double :battleship, size: 4 }
  let(:cruiser) { double :cruiser, size: 3 }
  let(:submarine) { double :submarine, size: 3 }
  let(:destroyer) { double :destroyer, size: 2 }


  describe '#fleet', :fleet do
    it 'Returns an empty array upon initialisation' do
      expect(subject.fleet).to be_empty
      expect(subject.fleet).to eq([])
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
end
