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
    
  end



  
end