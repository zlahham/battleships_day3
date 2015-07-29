require_relative "cell"

class Grid

     DEFAULT_SIZE = 10
    # attr_reader :array
    attr_reader :size

  def initialize(options = {size: DEFAULT_SIZE} )
    @size = options[:size]
    create_grid
  end

  def create_grid
    @array = Array.new(@size, Cell.new).map{ |row| Array.new(@size, Cell.new) }
  end
end
