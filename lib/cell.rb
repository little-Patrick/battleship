

class Cell
  attr_reader :coordinate, :empty, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
    @ship = ()
  end

  def empty?
    if @ship != nil
      @empty = false
    end
    @empty
  end

  def place_ship(ship)
    if @empty == true
      @ship = ship
    end
  end
  
end