require_relative "ship"
require_relative "grid"

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
