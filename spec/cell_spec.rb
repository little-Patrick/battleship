require 'pry'
require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new('B4')
    @cruiser = Ship.new('Cruiser', 3)
  end

  describe 'exist' do
    it 'initializes' do
      expect(@cell).to be_an_instance_of(Cell)
    end

    it 'has elements' do
      expect(@cell.coordinate).to eq('B4')
      expect(@cell.ship).to eq(nil)
      expect(@cell.empty?).to eq(true)
    end
  end

  describe 'holding a ship in cell' do
    it 'places a ship' do
      @cell.place_ship(@cruiser)
      expect(@cell.ship).to eq(@cruiser)
      expect(@cell.empty?).to eq(false)
    end
  end

  describe '#cell being fired upon' do
    it 'does fired_upon work' do
      @cell.place_ship(@cruiser)

      expect(@cell.fired_upon?).to eq(false)

      @cell.fire_upon

      expect(@cell.ship.health).to eq(2)
      expect(@cell.fired_upon?).to eq(true)
    end
  end
end