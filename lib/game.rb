class Game
  attr_reader :player1, :player2, :current_turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_turn = player1
  end

  def end_turn
    @current_turn = (@current_turn == player1 ? player2 : player1)
  end
end
