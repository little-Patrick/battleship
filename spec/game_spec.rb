require './spec/spec_helper.rb'
require './lib/game.rb'

RSpec.describe Game do
  before(:each) do
  @game = Game.new
  end

  describe 'initialize' do
    it 'exists' do
      expect(@game).to be_an_instance_of(Game)
      expect(@game.player_ships.count).to eq(2)
    end
  end
end

