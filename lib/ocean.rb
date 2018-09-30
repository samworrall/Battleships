class Ocean
  attr_reader :hit

  def initialize
    @hit = false
  end

  def take_hit
    @hit = true
  end

  def hit?
    @hit
  end
end
