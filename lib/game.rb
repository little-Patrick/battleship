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

  def start
    place_computers_ships
  end


  private

  def place_computers_ships
    placed = false
    until placed = true
      computer_ships.valid_coordinate?
      if coordinate = valid?
        use coordinate

        computer_ship.length = cell.count

        placed = true
      end
    end
  end
  
end