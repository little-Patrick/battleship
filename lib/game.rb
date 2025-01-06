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
    puts "The seas be still... for now. Place your ships, Admiral."
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
    display_board
  end


  def game_over?
    player_ships_afloat = @player_board.render(true).include?("S")
    computer_ships_afloat = @computer_board.render(true).include?("S")
    if player_ships_afloat == false
      puts "Wow you're bad at this game"
      puts "Loser"
      true
    elsif computer_ships_afloat == false
      puts "The final missile has been fired, and a still takes to the seas..." 
      puts "The tale of what happened here today will live on in the whisper of the waves, and the heart of the sailors who carry on..."
      puts "You Have Emerged Victorious"
      true
    else 
      false
    end
  end


  def player_turn
    loop do
      puts "Coordinate to fire upon?"
      player_guess = gets.chomp.upcase
      if @computer_board.valid_coordinate?(player_guess) && @computer_board.cells[player_guess].fired_upon? == false
        @computer_board.cells[player_guess].fire_upon
        if  @computer_board.cells[player_guess].empty?
          puts ' '
          puts 'SpLoOoOoOOsH...'
        else
          puts ' '
          puts'!!!!KAhbOooOOoOMmmM!!!'
        end
        break
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
        puts ' '
        puts "----THE ENEMY FIRED UPON #{computer_guess}------"
        break
      end
    end

  end

  private

  def place_computers_ships
    @computer_ships.each do |ship|
      loop do
        potential_coordinates = @computer_board.cells.keys.sample(ship.length)
        if @computer_board.valid_placement?(ship, potential_coordinates)
          @computer_board.place(ship, potential_coordinates)
          break
        end
      end
    end
  end

  def place_player_ships
    @player_ships.each do |ship|
      loop do
        puts "Select #{ship.length} coordinates (A letter and a number, A-D, 1-4) for your #{ship.name} to be stationed."
        potential_coordinates = gets.chomp().to_s.upcase.split(", ")
        if @player_board.valid_placement?(ship, potential_coordinates)
          @player_board.place(ship, potential_coordinates)
          break
        end
      end
    end
  end
    
  def display_board
    puts ' '
    puts '---THE ENEMY---'
    puts @computer_board.render
    puts ' '
    puts '---FRIENDLY---'
    puts @player_board.render(true)
  end
end