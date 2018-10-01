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

end
