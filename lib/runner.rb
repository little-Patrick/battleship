require './spec/spec_helper'


puts "Welcome to BATTLESHIP"
battleship = @Game.new
puts "Enter p to play. Enter q to quit."

start_game = gets.chomp()


if start_game == 'q' 
    exit
  
else start_game == 'p'
  battleship.start
end