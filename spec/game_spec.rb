require 'game'

describe Game do
  let(:subject) { Game.new(player1, player2) }
  let(:player1) { double :player1, board: board, fleet_placed?: false }
  let(:player2) { double :player2, board: board, fleet_placed?: false }
  let(:board) { double :board, grid: {"A1" => cell1, "A2" => cell2, "A3" => cell3, "A4" => cell4} }
  let(:cell1) { double :cell1, content: ocean, hit?: false, take_hit: nil }
  let(:cell2) { double :cell2, content: ocean, hit?: true }
  let(:cell3) { double :cell3, content: ship2, hit?: true }
  let(:cell4) { double :cell4, content: ship, hit?: false, take_hit: nil }
  let(:ocean) { double :ocean, instance_of?: true }
  let(:ship) { double :ship, instance_of?: false, hit?: false }
  let(:ship2) { double :ship2, instance_of?: false, hit?: true }

  describe '#player1', :player1 do
    it 'returns player1' do
      expect(subject.player1).to eq(player1)
    end
  end

  describe '#player2', :player2 do
    it 'returns player2' do
      expect(subject.player2).to eq(player2)
    end
  end

  describe '#current_player', :current_player do
    it 'Returns player1 at the start of the game' do
      expect(subject.current_player).to eq(player1)
    end
  end

  describe '#other_player', :other_player do
    it 'Returns player2 at the start of the game' do
      expect(subject.other_player).to eq(player2)
    end
  end

  describe '#end_turn', :end_turn do
    it 'Changes current_player to player2 and other_player to player1' do
      subject.end_turn
      expect(subject.current_player).to eq(player2)
      expect(subject.other_player).to eq(player1)
    end
  end

  describe '#fire_missile', :fire do
    it 'Throws an error if that tile has already been hit' do
      expect { subject.fire_missile("A2") }.to raise_error("You have already hit this tile!")
    end
  end

  describe '#view_opponent_tile', :view_opponent_tile do
    it 'Returns Ocean' do
      expect(subject.view_opponent_tile("A2")).to eq("Ocean")
    end

    it 'Returns Enemy Ship' do
      expect(subject.view_opponent_tile("A3")).to eq("Enemy Ship")
    end

    it 'Throws an error if the tile being viewed has not been hit' do
      expect { subject.view_opponent_tile("A4") }.to raise_error("You have not hit this tile yet!")
    end
  end

  describe '#view_my_tile', :view_my_tile do
    it 'Returns Ocean' do
      expect(subject.view_my_tile("A1")).to eq("Ocean")
    end

    it 'Returns Your Ship(hit)' do
      expect(subject.view_my_tile("A3")).to eq("Your Ship(hit)")
    end

    it 'Returns Your Ship' do
      expect(subject.view_my_tile("A4")).to eq("Your Ship")
    end
  end

  context 'No ships on either board' do
    describe '#fire_missile', :fire do
      it 'Returns miss' do
        expect { subject.fire_missile("A1") }.to output("\"miss!\"\n").to_stdout
      end
    end

    describe '#all_ships_placed?', :all_ships_placed? do
      it 'Returns false' do
        expect(subject.all_ships_placed?).to eq(false)
      end
    end
  end

  context 'All ships on both boards' do
    let(:subject) { Game.new(player1, player2) }
    let(:player1) { double :player1, fleet_placed?: true }
    let(:player2) { double :player2, fleet_placed?: true, fleet_destroyed?: true, board: board }

    describe '#all_ships_placed?', :all_ships_placed? do
      it 'Returns true' do
        expect(subject.all_ships_placed?).to eq(true)
      end
    end

    describe '#fire_missile', :fire_missile do
      it 'Returns hit!' do
        expect { subject.fire_missile("A4") }.to output("\"hit!\"\n").to_stdout
      end

      it 'Changes the current player to player2' do
        subject.fire_missile("A4")
        expect(subject.current_player).to eq(player2)
      end
    end

    describe '#game_won?', :game_won? do
      it 'Returns true' do
        expect(subject.game_won?).to eq(true)
      end
    end
  end
end
