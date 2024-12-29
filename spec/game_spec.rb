require './spec/spec_helper.rb'
require './lib/game.rb'

RSpec.describe Game do
  @game = Game.new

  describe 'initialize' do
    it 'exists' do
      expect(@game).to be_an_instance_of(Game)
    end

    it 'starts' do
      
    end

    it 'has a game over' do
      
    end
  end
end

