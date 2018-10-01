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
    @grid[coord].content = ship
    keys = @grid.keys
    index = @grid.find_index { |k,| k == coord }
    (1...ship.size).each { |n| @grid[keys[index + n*10]].content = ship }
  end

end
