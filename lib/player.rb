class Player
  attr_accessor :fleet, :board

  def initialize(ship_class, board_class)
    @fleet = {}
    @ship_class = ship_class
    @board = board_class.new
  end

  def construct_fleet
    @fleet[:carrier] = @ship_class.carrier
    @fleet[:battleship] = @ship_class.battleship
    @fleet[:cruiser] = @ship_class.cruiser
    @fleet[:submarine] = @ship_class.submarine
    @fleet[:destroyer] = @ship_class.destroyer
  end

  def fleet_placed?
    return true if
    @fleet.each { |_, v| return false unless v.placed? }
  end

  def fleet_destroyed?
    return true if
      @fleet.each { |_, v| return false unless v.destroyed? }
  end
end
