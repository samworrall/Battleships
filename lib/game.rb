class Game
  attr_reader :player1, :player2, :current_player, :other_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @other_player = player2
  end

  def all_ships_placed?
    @player1.fleet_placed? && @player2.fleet_placed?
  end

  def end_turn
    @current_player, @other_player = @other_player, @current_player
  end

  def fire_missile(coord)
    opponent_tile(coord).hit? ? target_already_hit : hit_target(coord)
  end

  def view_my_tile(coord)
    p my_tile_is_ocean?(coord) ? "Ocean" :
    my_tile(coord).content.hit? ? "Your Ship(hit)" : "Your Ship"
  end

  def view_opponent_tile(coord)
    p opponent_tile(coord).hit? ?
    (opponent_tile_is_ocean?(coord) ?
    "Ocean" : "Enemy Ship" ) : target_not_yet_hit
  end

  def game_won?
    @other_player.fleet_destroyed?
  end

  private

  def hit_target(coord)
    opponent_tile(coord).take_hit
    p opponent_tile_is_ocean?(coord) ? "miss!" : "hit!"
  end

  def target_already_hit
    raise("You have already hit this tile!")
  end

  def target_not_yet_hit
    raise("You have not hit this tile yet!")
  end

  def opponent_tile(coord)
    @other_player.board.grid[coord]
  end

  def my_tile(coord)
    @current_player.board.grid[coord]
  end

  def opponent_tile_is_ocean?(coord)
    opponent_tile(coord).content.instance_of? Ocean
  end

  def my_tile_is_ocean?(coord)
    my_tile(coord).content.instance_of? Ocean
  end
end
