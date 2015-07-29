class Ship

  def initialize
    @placed = false
  end

  def placed?
    @placed
  end

  def confirm_place
    raise "Ship has already been placed" if placed?
    @placed = true
  end

end
