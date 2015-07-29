require_relative "ship"
require_relative "grid"

class Board

  attr_reader :ships

  def initialize (options = {container: Grid})
    @container = options[:container]
    @ships = []
    @grid = @container.create
  end

  def place ship, grid = @grid
    @ships << ship
    @grid.insert
  end
end