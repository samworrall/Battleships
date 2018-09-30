class Battleship
  attr_reader :size, :hits

  def initialize(size)
    @size = size
    @hits = 0
  end

  def take_hit
    @hits += 1
  end

  def destroyed?
    @hits == @size
  end

  def self.Cruiser
    self.new(5)
  end

  def self.Battleship
    self.new(4)
  end
end
