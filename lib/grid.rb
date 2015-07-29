require_relative "cell"

class Grid
  DEFAULT_SIZE = 10
  attr_reader :array
  attr_reader :size

  def initialize(options = {size: DEFAULT_SIZE, content: Cell.new} )
    @size = options[:size]
    @content = options[:content]
    create_grid
  end

  def create_grid
    @array = Array.new(@size){Array.new(@size)}
    populate_grid
  end

  def populate_grid
    @array = @array.map! {|inner_array| inner_array.map! {|x| x = Cell.new } } #requires refactor
  end
end
