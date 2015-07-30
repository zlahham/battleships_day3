require_relative "cell"

class Grid

  def self.create (options = {size: @size})
    size = options[:size]
    Grid.new(options = {size: size, content: Cell})
  end

  DEFAULT_SIZE = 10

  attr_reader :grid_locations, :size

  def initialize(options = {size: DEFAULT_SIZE, content: Cell} )
    @size = options[:size]
    @content = options[:content]
    create_grid
  end

  def insert(ship, coordinate)
    coordinate_converter(coordinate)
    grid_locations[@coords[0]][@coords[1]].content = ship
    ship_placement_calculator(ship, coordinate)
  end

  def ship_placement_calculator(ship, coordinate)
    (ship.size-1).times { @coords[0] += 1 ; grid_locations[@coords[0]][@coords[1]].content = ship}
    #check if this is ok???
  end

  private

  def create_grid
    @grid_locations = Array.new(@size){Array.new(@size)}
    populate_grid
  end

  def populate_grid
    @grid_locations = @grid_locations.map! { |inner_array| inner_array.map! {|x| x = @content.create } }
  end

  def coordinate_converter(coordinate)
    x = coordinate[0].upcase.ord - 65
    y = coordinate[1..-1].to_i - 1
    @coords = [x,y]
  end
end
