class Game
  attr_reader :player1, :player2, :current_player, :other_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @other_player = player2
  end

  def end_turn
    @current_player, @other_player = @other_player, @current_player
  end

  # def fire_missile(coord)
  #
  # end
end
