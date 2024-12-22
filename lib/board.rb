

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
    # ship.length == coordinate.count ? c_and_l = true : c_and_l = false
    return false if ship.length != coordinate.count
    #letter
    row = coordinate.map do |letter| 
      letter.slice(0, 1)
    end
    # #number
    column  = coordinate.map do |num| 
      num.slice(1, 1).to_i
    end
    
    valid_placement = []

    if row.uniq.length == 1
      column.each_cons(2) do |a, b| 
        valid_placement << (b - a == 1)
      end
    elsif column.uniq.length == 1
      row.each_cons(2) do |a, b| 
        binding.pry
        valid_placement << (b.ord - a.ord == 1)
        
      end
    else
      return false
    end
    valid_placement.all?{|b| b == true}
  end
end

  

    #   row_ordered = row == row.sort
    # binding.pry
    #   if row.all? do |letter|
    #       row[0] == letter
    #     end
    #   binding.pry
    #     column_ordered = column == column.sort.each_cons(2) {|a, b| return false if b - a != 1}
    #   end
    # row_same = row.uniq.length == 1
    # column_same = column.uniq.length == 1

    
    
    # if row_same == true || column_same == true
    #   diagonal = false
    # else 
    #   diagonal = true
    # end

    #   if c_and_l == true && row_ordered == true && column_ordered == true && diagonal == false
    #     @valid_placement = true
    #   else
    #     @valid_placement = false
    #   end
      
    #   @valid_placement  
    #   # binding.pry

# array to be in order
# confirms array has the same value

## Split string into row and column
  # iterate over row to see if letters are the same
  # see if numbers are in order
  # it is a valid placement
  # elsif the column numbers are the same
  # see if the letters are in order
  # the ship placement is valid
  # else valid placement is false
