class Player
  attr_accessor :fleet, :board

  def initialize(ship_class, board_class)
    @fleet = []
    @ship_class = ship_class
    @board = board_class.new
  end

  def construct_fleet
    @fleet +=  [@ship_class.carrier, @ship_class.battleship, @ship_class.cruiser,
    @ship_class.submarine, @ship_class.destroyer]
  end
end
