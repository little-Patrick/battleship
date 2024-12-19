

class Cell
  attr_reader :coordinate, :empty, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
  end

  def empty?
    if @ship != nil
      @empty = false
    end
  end
  
end