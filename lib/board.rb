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
    @grid[coord].content = ship
    @keys = @grid.keys
    @index = @grid.find_index { |k,| k == coord }
    orientation == "vertical" ?
    place_vertically(ship) : place_horizontally(ship)
  end

  private

  def check_valid_orientation(orientation)
    raise("Orientation must either be vertical or horizontal") unless
    (orientation == 'vertical' || orientation == 'horizontal')
  end

  def place_vertically(ship)
    (1...ship.size).each { |n| @grid[@keys[@index + n * 10]].content = ship }
  end

  def place_horizontally(ship)
    (1...ship.size).each { |n| @grid[@keys[@index + n]].content = ship }
  end

end
