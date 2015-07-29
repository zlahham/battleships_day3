require_relative "water"

class Cell

  attr_reader :content

  def initialize(content = Water.new)
    @content = content
  end
end
