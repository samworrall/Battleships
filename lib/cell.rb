require_relative 'ocean'

class Cell
  attr_reader :content

  def initialize(content = Ocean.new)
    @content = content
  end
end
