require './spec/spec_helper'


puts "Welcome to BATTLESHIP"
battleship = Game.new
puts "Enter p to play. Enter q to quit."

start_game = gets.chomp()


if start_game == 'q' 
    exit
  
else start_game == 'p'
  battleship.start
end

puts "The final missile has been fired, and a still takes to the seas... The tale of what happened here today will live on in the whisper of the waves, and the heart of the sailors who carry on..."