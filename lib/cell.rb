require_relative 'ocean'

class Cell
  attr_accessor :content

  def initialize(content = Ocean.new)
    @content = content
  end
end
