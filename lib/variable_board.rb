



class VariableBoard
  attr_reader :cells, 
              :valid_coordinate,
              :valid_placement,
              :row,
              :column

  def initialize(row, column)
    @cells = {}
      ('a'...(('a'.ord + row.ord).chr)).each do |r|
        (1..column).each do |c|
          coordinate = "#{r.upcase}#{c}"
          @cells[coordinate] = Cell.new(coordinate)
        end
      end
    @valid_coordinate = false
    @valid_placement = false
    @row = row
    @column = column
  end

  def valid_coordinate?(coordinate)
    if @cells.include?(coordinate) == true
      @valid_coordinate = true
    else
      @valid_coordinate = false
    end
  end

  def valid_placement?(ship, coordinates)
    return false if ship.length != coordinates.count || coordinates.any? { |coordinate| cells[coordinate].empty? == false}
    #letter
    row = coordinates.map do |letter| 
      letter.slice(0, 1)
    end
    # #number
    column  = coordinates.map do |num| 
      num.slice(1, 1).to_i
    end
    if row.uniq.length == 1
      column.each_cons(2).all? do |a, b| 
        @valid_placement = true if (b - a == 1)
      end
    elsif column.uniq.length == 1
      row.each_cons(2).all? do |a, b| 
        @valid_placement = true if (b.ord - a.ord == 1)
        end
    else
      return @valid_placement = false
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates) == true
      coordinates.each do |coordinate|
        cells[coordinate].place_ship(ship)
      end
    end
  end

  def render(show = false)
    render_cells = @cells.values.map{|x| x.render(show)}
    render_cells.each_slice(column){|x| print "#{x.join(' ')}\n"}
  end
end
