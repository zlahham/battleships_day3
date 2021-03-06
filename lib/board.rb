require_relative "ship"
require_relative "grid"
require_relative "cell"

class Board

  attr_reader :ships, :grid

  def initialize (options = { size: 10, container: Grid })
    @size = options[:size]
    @container = options[:container]
    @ships = []
    @grid = @container.create options = {size: @size}
  end

  def place(ship, coordinate, direction=:horizontal)
    @grid.insert(ship, coordinate, direction)
    ship.confirm_place
    add_ship(ship)
  end

  def add_ship ship
    @ships << ship
  end

end
