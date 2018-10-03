require 'game'

describe Game do
  let(:subject) { Game.new(player1, player2) }
  let(:player1) { double :player1 }
  let(:player2) { double :player2 }

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

  describe '#current_turn', :current_turn do
    it 'Returns player1 at the start of the game' do
      expect(subject.current_turn).to eq(player1)
    end
  end

  describe '#end_turn', :end_turn do
    it 'Changes current_turn to player2' do
      subject.end_turn
      expect(subject.current_turn).to eq(player2)
    end
  end
end
