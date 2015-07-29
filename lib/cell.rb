require_relative "water"

class Cell

  attr_reader :content

  def initialize(options = {content: Water.new})
    @content = options[:content]
  end
end
