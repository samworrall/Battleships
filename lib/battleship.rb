class Battleship
  attr_reader :size, :hits

  def initialize(size)
    @size = size
    @hits = 0
  end
end
