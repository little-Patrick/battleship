

class Board
  attr_reader :cells, 
              :valid_coordinate,
              :valid_placement

  def initialize
    @cells = {
          "A1" => Cell.new('A1'),
          "A2" => Cell.new('A2'),
          "A3" => Cell.new('A3'),
          "A4" => Cell.new('A4'),
          "B1" => Cell.new('B1'), 
          "B2" => Cell.new('B2'), 
          "B3" => Cell.new('B3'), 
          "B4" => Cell.new('B4'), 
          "C1" => Cell.new('C1'), 
          "C2" => Cell.new('C2'), 
          "C3" => Cell.new('C3'), 
          "C4" => Cell.new('C4'), 
          "D1" => Cell.new('D1'), 
          "D2" => Cell.new('D2'), 
          "D3" => Cell.new('D3'), 
          "D4" => Cell.new('D4')
          }
  end
  def valid_coordinate?(coordinate)
   
    if @cells.include?(coordinate) == true
      @valid_coordinate = true
    else
      @valid_coordinate = false
    end
  end

  def valid_placement?(ship, coordinate)
  ship.length == coordinate.count ? c_and_l = true : c_and_l = false
  binding.pry
  coordinate.each 
  
  # coordinate.each_cons(ship.length){|x| x = ship.length}


    @valid_placement
  end
end

# array to be in order
# confirms array has the same value