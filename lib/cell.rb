require_relative "water"

class Cell

  def self.create
    Cell.new
  end

  attr_reader :content

  def initialize(options = {content: Water.new})
    @content = options[:content]
  end
end
