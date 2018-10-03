require 'game'

describe Game do
  let(:subject) { Game.new(player1) }
  let(:player1) { double :player1 }

  describe '#player1', :player1 do
    it 'returns player1' do
      expect(subject.player1).to eq(player1)
    end
  end
end
