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

  def insert(ship, coordinate, direction)
    coordinate_converter(coordinate)
    check_if_can_place(@coords)
    grid_locations[@coords[0]][@coords[1]].content = ship
    ship_placement_calculator(ship, coordinate, direction)
  end

  def ship_placement_calculator(ship, coordinate, direction) # Make sure sure it checks all of th cells before placing anything
    if direction == :horizontal
      (ship.size).times do
        @coords[1] += 1
        check_if_can_place([@coords[0],@coords[1]])
        grid_locations[@coords[0]][@coords[1]].content = ship
      end

    else
      (ship.size-1).times { @coords[0] += 1 ; grid_locations[@coords[0]][@coords[1]].content = ship}
    end
    #check if this is ok???
  end

  def check_if_can_place(coord)

    fail "Not available" unless grid_locations[coord[0]][coord[1]].content == Water

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
    y = coordinate[0].upcase.ord - 65
    x = coordinate[1..-1].to_i - 1
    @coords = [x,y]
  end
end
