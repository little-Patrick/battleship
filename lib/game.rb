class Game 
  attr_reader :player_board, 
              :computer_board, 
              :player_ships, 
              :computer_ships
              
  

  def initialize()
    @player_board = Board.new
    @computer_board = Board.new
    @player_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    @computer_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
  end



  def setup
    place_computers_ships
    place_player_ships
  end


  def game_over?
    
  end

  private

  def place_computers_ships
    placed = false
    until placed == true
      computer_ships.each do |ship|
        potential_coordinates =  @computer_board.cells.to_a.sample(ship.length)
        check = @computer_board.valid_placement?(ship, potential_coordinates)
      

        if check == true
          place_ship(ship, potential_coordinates)

          computer_ship.length = cell.count

          placed = true
        end

      end
    end
  end
end


# @computer_ships.each do |ship|
#   until ship.
# end

# place computer ships
# select 3 random coordinates 
#
#
#
# player places their ships
# 
#
#computer_ship.