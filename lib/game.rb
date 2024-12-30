class Game 
  attr_reader :player_board, :computer_board, :player_ships, :computer_ships
  

  def initialize()
    @player_board = Board.new
    @computer_board = Board.new
    @player_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    @computer_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
  end

  def start
    loop do 
      puts "Welcome to BATTLESHIP"

      computer_ships.each do 
      
  end

  def game_over?
    
  end


end


# place computer ships
# 
#
#
#
# player places their ships
# 
#