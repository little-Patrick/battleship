class Turn 
  attr_reader :player_turn, :computer_turn

  def initialize()
    @player_turn = # gets.chomp.to_s
    @computer_turn = # fires upon player board randomly
  end

  def player_turn
    coordinate_guess = gets.chomp()
    shots_fired = Game.player_turn(coordinate_guess)
    shots_fired.fire_upon

    board.render
  end

  def computer_turn
    
  end

end