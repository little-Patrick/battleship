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
    puts "The seas be still... for now. Place your ships, captain."
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


  def player_turn
    loop do
      player_guess = gets.chomp.upcase
      if @computer_board.valid_coordinate?(player_guess) && @computer_board.cells[player_guess].fired_upon? == false
        @computer_board.cells[player_guess].fire_upon
      else
        puts "Invalid Coordinate, Try Firing Again."
      end
    end
  end

  def computer_turn
    loop do
      computer_guess = @player_board.cells.keys.sample
      if @player_board.valid_coordinate?(computer_guess) && @player_board.cells[computer_guess].fired_upon? == false
        @player_board.cells[computer_guess].fire_upon
      end
    end
  end

  private

  def place_computers_ships
    placed = 0
    until placed == @computer_ships.count
      @computer_ships.each do |ship|
        potential_coordinates = @computer_board.cells.keys.sample(ship.length)
        check = @computer_board.valid_placement?(ship, potential_coordinates)
        if check == true
          @computer_board.place(ship, potential_coordinates)
          placed += 1
        else

        end
      end
    end
  end

  def place_player_ships
    placed = 0
    until placed == @player_ships.count
      @player_ships.each do |ship|
        puts "Select #{ship.length} coordinates (A letter and a number, A-D, 1-4) for your #{ship.name}."
        potential_coordinates = gets.chomp.upcase
        check = @player_board.valid_placement?(ship, potential_coordinates)
        if check == true
          @player_board.place(ship, potential_coordinates)
          placed += 1
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
