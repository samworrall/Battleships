require 'game'

describe Game do
  let(:subject) { Game.new(player1, player2) }
  let(:player1) { double :player1, board: board1 }
  let(:player2) { double :player2, board: board1 }
  let(:board1) { double :board1, grid: {"A1" => cell1, "A2" => cell2, "A3" => cell3, "A4" => cell4} }
  let(:cell1) { double :cell1, content: ocean, hit?: false, take_hit: nil }
  let(:cell2) { double :cell2, content: ocean, hit?: true }
  let(:cell3) { double :cell3, content: ship, hit?: true }
  let(:cell4) { double :cell4, content: ship, hit?: false }
  let(:ocean) { double :ocean, instance_of?: true }
  let(:ship) { double :ship, instance_of?: false }

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

  context 'No ships on either board' do
    describe '#fire_missile', :fire do
      it 'Returns miss' do
        expect(subject.fire_missile("A1")).to eq("miss!")
      end
    end
  end
end
