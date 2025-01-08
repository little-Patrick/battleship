class Game 
  attr_reader :player_board, 
              :computer_board, 
              :player_ships, 
              :computer_ships
              :last_guess
  

  def initialize()
    @player_board = Board.new
    @computer_board = Board.new
    @player_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    @computer_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    @last_guess = nil
  end

  def start
    puts "Place your ships, Admiral."
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
    play_again?
  end


  def game_over?
    player_ships_afloat = @player_board.render(true).include?("S")
    computer_ships_afloat = @computer_board.render(true).include?("S")
    if player_ships_afloat == false
      type_out("Wow...", 0.3) 
      type_out("You're bad at this game.")
      type_out("Maybe next time, Loser.")
      puts " "
      true
    elsif computer_ships_afloat == false
      type_out("The final missile has been fired, and a still takes to the seas...", 0.01)
      type_out("The tale of what happened here today will live on in the whisper of the waves, and the heart of the sailors who carry on...", 0.01)
      puts " "
      puts " "
      puts " "
      type_out("You Have Emerged Victorious.", 0.16)
      puts " "
      puts " "
      puts " "
      true
    else 
      false
    end
  end


  def player_turn
    loop do
      type_out("Coordinate to fire upon?", 0.01)
      player_guess = gets.chomp.upcase
      if @computer_board.valid_coordinate?(player_guess) && @computer_board.cells[player_guess].fired_upon? == false
        @computer_board.cells[player_guess].fire_upon
        if  @computer_board.cells[player_guess].empty?
          puts ' '
          type_out('SpLoOoOoOsH...')
        else
          puts ' '
          type_out('!!!!KAhbOooOOoOMmmM!!!', 0.05)
        end
        break
      else
        puts "Invalid Coordinate, Try Firing Again."
      end
    end
  end

  # def computer_turn
  #   last_guess = nil
  #   loop do
  #     if last_guess && @player_board.cells[last_guess].render == 'H' 
  #       nearby_coords = check_surroundings(last_guess)
  #       if nearby_coords && nearby_coords.empty?
  #         computer_guess = nearby_coords.first
  #         if @player_board.valid_coordinate?(computer_guess) && @player_board.cells[computer_guess].fired_upon? == false
  #           @player_board.cells[computer_guess].fire_upon
  #           puts ' '
  #           type_out("THE ENEMY FIRED UPON #{computer_guess}", 0.08)
  #           last_guess = computer_guess
  #           break
  #         end
  #       else
  #         computer_guess = @player_board.cells.keys.sample
  #         if @player_board.valid_coordinate?(computer_guess) && @player_board.cells[computer_guess].fired_upon? == false
  #             @player_board.cells[computer_guess].fire_upon
  #             puts ' '
  #             type_out("THE ENEMY FIRED UPON #{computer_guess}", 0.08)
  #             last_guess = computer_guess
  #             break
  #         end   
  #       end
  #     else
  #         computer_guess = @player_board.cells.keys.sample(1)
  #         if @player_board.valid_coordinate?(computer_guess) && @player_board.cells[computer_guess].fired_upon? == false
  #             @player_board.cells[computer_guess].fire_upon
  #             puts ' '
  #             type_out("THE ENEMY FIRED UPON #{computer_guess}", 0.08)
  #             last_guess = computer_guess
  #             break
  #         end
  #     end
  #   end
  # end
  def computer_turn
    loop do
      if @last_guess && @player_board.cells[@last_guess].render == 'H' && !@player_board.cells[@last_guess].empty?
        puts "Last guess was a hit: #{@last_guess}"  # Debug: Check if last guess was a hit
        nearby_coords = check_surroundings(@last_guess)
        puts "Nearby coords: #{nearby_coords}"  # Debug: Check surrounding coordinates
  
        if nearby_coords && !nearby_coords.empty?
          computer_guess = nearby_coords.first  # Get the first nearby coordinate
          puts "Trying nearby target: #{computer_guess}"  # Debug: What is the target?
  
          if @player_board.valid_coordinate?(computer_guess) && !@player_board.cells[computer_guess].fired_upon?
            @player_board.cells[computer_guess].fire_upon
            puts ' '
            type_out("THE ENEMY FIRED UPON #{computer_guess}", 0.08)
            @last_guess = computer_guess
            break
          end
        else
          # Fallback to random guess if no nearby targets
          computer_guess = @player_board.cells.keys.sample
          puts "No nearby targets, trying random guess: #{computer_guess}"  # Debug: Random guess fallback
          if @player_board.valid_coordinate?(computer_guess) && !@player_board.cells[computer_guess].fired_upon?
            @player_board.cells[computer_guess].fire_upon
            puts ' '
            type_out("THE ENEMY FIRED UPON #{computer_guess}", 0.08)
            @last_guess = computer_guess
            break
          end
        end
      else
        # First turn or miss
        computer_guess = @player_board.cells.keys.sample
        puts "First guess or miss, random target: #{computer_guess}"  # Debug: Random guess
        if @player_board.valid_coordinate?(computer_guess) && !@player_board.cells[computer_guess].fired_upon?
          @player_board.cells[computer_guess].fire_upon
          puts ' '
          type_out("THE ENEMY FIRED UPON #{computer_guess}", 0.08)
          @last_guess = computer_guess
          break
        end
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
        type_out("Select #{ship.length} coordinates (A letter and a number, A-D, 1-4. Please input in alphabetical order.) for your #{ship.name} to be stationed.", 0.01)
        potential_coordinates = gets.chomp().to_s.upcase.split(", ")
        if @player_board.valid_placement?(ship, potential_coordinates)
          @player_board.place(ship, potential_coordinates)
          break
        end
      end
    end
  end
    
  def display_board
    type_out('      ')
    puts '---THE ENEMY---'
    puts @computer_board.render
    puts ' '
    puts '---FRIENDLY---'
    puts @player_board.render(true)
  end

  def type_out(text, delay = 0.1)
    text.each_char do |char|
      print char
      $stdout.flush
      sleep(delay)
    end
    puts
  end

  def clear_boards
    @player_board.clear
    @computer_board.clear
  end

  def ships_repaired
    @player_ships.each do |ship|
      ship.repair
    end
    @computer_ships.each do |ship|
      ship.repair
    end
  end

  def play_again?
    loop do
      puts " "
      puts " "
      puts " "
      puts "Play again?"
      puts "Y or N?"
      user_input = gets.chomp().upcase

      if user_input == "Y"
        clear_boards
        ships_repaired
        start
        break
      elsif user_input == "N"
        puts "Thank you for playing!"
        break
      else
        puts "Invalid input. Would you like to play again?"
        puts "Y or N?"
      end
    end
  end

  # def check_surroundings(coordinate)
  #   row, col = coordinate.split('')
  #   row_idx = row.ord - 'A'.ord
  #   col_idx = col.to_i - 1

  #   surrounding_coords = ["#{(row_idx - 1 +4) % 4 + 'A'.ord.chr}#{col}", "#{(row_idx + 1) % 4 + 'A'.ord.chr}#{col}", "#{row}#{col_idx - 1 + 1}", "#{row}#{col_idx +1 + 1}"]

  #   valid_coords = surrounding_coords.select do |coord|
  #     @player_board.valid_coordinate?(coord) && !@player_board.cells[coord].fired_upon?  
  #   end
  #   return valid_coords
  # end
  def check_surroundings(coordinate)
    row, col = coordinate.split('')
    row_idx = row.ord - 'A'.ord
    col_idx = col.to_i - 1  # Corrected to 'col.to_i', not 'col.to_1'
  
    surrounding_coords = [
      "#{(row_idx - 1 + 4) % 4 + "A".ord}#{col}",  # Up: wrap around if out of bounds
      "#{(row_idx + 1) % 4 + "A".ord}#{col}",      # Down: wrap around if out of bounds
      "#{row}#{col_idx - 1 + 1}",                       # Left: decrease column
      "#{row}#{col_idx + 1 + 1}"                        # Right: increase column
    ]
  
    # Collect all valid surrounding coordinates
    valid_coords = surrounding_coords.select do |coord|
      @player_board.valid_coordinate?(coord) && !@player_board.cells[coord].fired_upon?
    end
  
    return valid_coords  # Return all valid surrounding coordinates
  end
  
end