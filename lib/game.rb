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



  def turn(player)
    if player == player
      loop do
        gets chomp
      end
    elsif player == computer
      loop do
        computer_guess = @player_board.cells.keys.sample
        if @player_board.valid_coordinate?(computer_guess) && @player_board.cells[computer_guess].fired_upon? == false
          @player_board.cells[computer_guess].fire_upon
        end
      end
    end

  end

end