require_relative 'ocean'

class Cell
  attr_accessor :content, :hit

  def initialize(content = Ocean.new)
    @content = content
    @hit = false
  end

  def hit?
    @hit
  end

  def take_hit
    @hit = true
    @content.take_hit
  end
end
