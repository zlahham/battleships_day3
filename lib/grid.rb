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
    alpha_table = {}
    (('A'..'Z').zip(0..25)).each { |x| alpha_table[x[0]] = x[1] }
    coord_arr = coordinate.to_s.split('')
    x = coord_arr[0]
    y = coord_arr[1]
    @x = alpha_table[x.upcase]
    @y = (y.to_i - 1)
  end

end
