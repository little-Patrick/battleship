

class Cell
  attr_reader :coordinate, :empty, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
    @ship = ()
    @fired_upon = false
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
      @empty = false
    end
  end

  def fired_upon?
    @fired_upon
  end
  
  def fire_upon
    if @empty == false
      @ship.hit
      @fired_upon = true
    end
  end
end