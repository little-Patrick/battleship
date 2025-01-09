

class Cell
  attr_reader :coordinate, :empty, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
    @ship = nil
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
    @fired_upon = true

    if @empty == false
      @ship.hit
    end
  end

  def render(show = false)

    if @fired_upon == false && show == true && @ship
      'S'
    elsif @fired_upon == false
      '.'
    elsif @fired_upon == true && @empty == true
      'M'
    elsif @fired_upon == true && @empty == false && @ship.sunk? == false
      'H'
    else @fired_upon == true && @empty == false && @ship.sunk? == true
      'X'
    end

  end

  def reset
    @fired_upon = false
    @ship = nil
    @empty = true
  end
end