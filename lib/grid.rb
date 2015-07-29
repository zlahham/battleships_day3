require_relative "cell"

class Grid

  def self.create
    Grid.new
  end

  DEFAULT_SIZE = 10
  attr_reader :array, :size

  def initialize(options = {size: DEFAULT_SIZE, content: Cell} )
    @size = options[:size]
    @content = options[:content]
    create_grid
  end

  def create_grid
    @array = Array.new(@size){Array.new(@size)}
    populate_grid
  end

  def populate_grid
    @array = @array.map! { |inner_array| inner_array.map! {|x| x = @content.create } }
  end

  def insert  # WORK HERE NEXT
    true
  end

end
