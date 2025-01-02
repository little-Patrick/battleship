class Game 
  attr_reader :player_board, :computer_board

  def initialize()
    @player_board = Board.new
    @computer_board = Board.new
  end

  def start
    puts "Welcome to BATTLESHIP"
    ## this will create the loop for the game
  end

  def game_over?
    # when the board has no more "S" showing
  end



  def player_turn
    loop do
      player_guess = gets.chomp.upcase
      if @@computer_board.valid_coordinate?(player_guess) && @computer_board.cells[player_guess].fired_upon? == false
        @computer_board.cells[player_guess].fire_upon
      else
        puts "Invalid Coordinate, try firing again."
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

end