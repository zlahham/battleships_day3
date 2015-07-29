require_relative "cell"

class Grid

  def self.create
    Grid.new
  end

  DEFAULT_SIZE = 10
  attr_reader :grid_locations, :size
  #attr_accessor :content

  def initialize(options = {size: DEFAULT_SIZE, content: Cell} )
    @size = options[:size]
    @content = options[:content]
    create_grid
  end

  def create_grid
    @grid_locations = Array.new(@size){Array.new(@size)}
    populate_grid
  end

  def populate_grid
    @grid_locations = @grid_locations.map! { |inner_array| inner_array.map! {|x| x = @content.create } }
  end


  def insert(ship, coordinate)
    coordinate_converter(coordinate)
    grid_locations[@x][@y].content = ship
  end



  private

  def coordinate_converter(coordinate)
    @x = coordinate.slice(0).upcase.ord - 65
    coordinate.slice!(-0)
    y = coordinate.to_i
    @y = y -1
  end

end
