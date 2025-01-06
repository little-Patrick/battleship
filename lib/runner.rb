require './spec/spec_helper'


puts "Welcome to BATTLESHIP"
battleship = Game.new
puts "Enter p to play. Enter q to quit."

start_game = gets.chomp()


if start_game == 'q' 
  puts 'Quitter!!'
    exit
  
else start_game == 'p'
  puts "The sea was angry that day, my friends"
  battleship.start
end

