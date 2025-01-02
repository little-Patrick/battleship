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



  def start
    puts "Welcome to Battleship!"
    place_computers_ships
    place_player_ships

    display_board
    until game_over?
      player_turn
      break if game_over?
      computer_turn
      break if game_over?
      display_board
    end
    puts "-------GAME OVER-------"
  end


  def game_over?

    player_ships_afloat = @player_board.render(true).flatten.include?("S")
    computer_ship_afloat = @computer_board.render(true).flatten.include?("S")
  
    if player_ship_afloat = false
      puts "you lose"
      true
    elsif computer_ship_afloat = false
      puts "you win"
      true
    else 
      false
    end
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

  def display_board
    puts 'THE ENEMY'
    puts @computer_board.render
    puts 'Friendly'
    puts @player_board.render(true)
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
