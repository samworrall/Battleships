class Game
  attr_reader :player1, :player2, :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def end_turn
    @current_player = (@current_player == player1 ? player2 : player1)
  end

  # def fire_missile(coord)
  #
  # end
end
