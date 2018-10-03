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

  # context 'No ships on either board' do
  #   describe '#fire_missile', :fire do
  #     it 'Returns miss' do
  #       expect(subject.fire_missile("A1")).to eq("miss!")
  #     end
  #   end
  # end
end
