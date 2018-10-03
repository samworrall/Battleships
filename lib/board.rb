require_relative 'cell'

class Board
  attr_reader :grid

  def initialize(cell = Cell)
    @grid = {}
    @cell = cell
  end

  def construct_grid
    ('A'..'J').each do |l|
      (1..10).each do |n|
        @grid["#{l}#{n}"] = @cell.new
      end
    end
  end

  def place_ship(coord, ship, orientation)
    check_valid_orientation(orientation)

    @y_coord = coord.split("").first
    @keys = @grid.keys
    @index = @grid.find_index { |k,| k == coord }

    orientation == "vertical" ?
    place_vertically(ship) : place_horizontally(ship)

    @grid[coord].content = ship
  end

  private

  def check_valid_orientation(orientation)
    raise("Orientation must either be vertical or horizontal") unless
    (orientation == 'vertical' || orientation == 'horizontal')
  end

  def place_vertically(ship)
    vertical_error_check(ship)
    vertical_obstruction_check(ship)
    (1...ship.size).each { |n| @grid[@keys[@index + n * 10]].content = ship }
    ship.place
  end

  def vertical_error_check(ship)
    raise("There is not enough space for this ship here") if
    @grid[@keys[@index + ((ship.size - 1) * 10)]].nil?
  end

  def vertical_obstruction_check(ship)
    (0...ship.size).each { |n| obstruction_error if
    @grid[@keys[@index + n * 10]].content.instance_of? Battleship
    }
  end

  def place_horizontally(ship)
    horizontal_error_check(ship)
    horizontal_obstruction_check(ship)
    (1...ship.size).each { |n| @grid[@keys[@index + n]].content = ship }
    ship.place
  end

  def horizontal_error_check(ship)
    raise("There is not enough space for this ship here") if
    @keys[@index + ship.size - 1].split("").first != @y_coord
  end

  def horizontal_obstruction_check(ship)
    (0...ship.size).each { |n| obstruction_error if
    @grid[@keys[@index + n]].content.instance_of? Battleship
    }
  end

  def obstruction_error
    raise("There is another ship blocking this placement")
  end

end
