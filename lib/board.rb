require_relative "ship"
require_relative "grid"
require_relative "cell"

class Board

  attr_reader :ships, :grid

  def initialize (options = {container: Grid})
    @container = options[:container]
    @ships = []
    @grid = @container.create
  end

  def place(ship, coordinate, grid = @grid)
    @ships << ship
    @grid.insert(ship, coordinate)
  end
end



# board.grid.grid_locations[0][5].content = Ship.new