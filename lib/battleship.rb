class Battleship
  attr_reader :size, :hits, :placed

  def initialize(size)
    @size = size
    @hits = 0
    @placed = false
  end

  def take_hit
    @hits += 1
  end

  def destroyed?
    @hits == @size
  end

  def placed?
    @placed
  end

  def self.carrier
    new(5)
  end

  def self.battleship
    new(4)
  end

  def self.cruiser
    new(3)
  end

  def self.submarine
    new(3)
  end

  def self.destroyer
    new(2)
  end
end
