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

  def fire_missile(coord)
    @other_player.board.grid[coord].hit? ? target_already_hit : hit_target(coord)
  end

  def view_opponent_tile(coord)
    p @other_player.board.grid[coord].hit? ? ((@other_player.board.grid[coord].content.instance_of? Ocean) ? "Ocean" : "Enemy Ship" ) : target_not_yet_hit
  end

  private

  def hit_target(coord)
    @other_player.board.grid[coord].take_hit
    p (@other_player.board.grid[coord].content.instance_of? Ocean) ? "miss!" : "hit!"
  end

  def target_already_hit
    raise("You have already hit this tile!")
  end
end
