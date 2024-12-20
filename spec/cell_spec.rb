require 'pry'
require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before(:each) do
    @cell_1 = Cell.new('B4')
    @cell_2 = Cell.new('C3')
    @cruiser = Ship.new('Cruiser', 3)
  end

  describe 'exist' do
    it 'initializes' do
      expect(@cell_1).to be_an_instance_of(Cell)
    end

    it 'has elements' do
      expect(@cell_1.coordinate).to eq('B4')
      expect(@cell_1.ship).to eq(nil)
      expect(@cell_1.empty?).to eq(true)
    end
  end

  describe 'holding a ship in cell_1' do
    it 'places a ship' do
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.ship).to eq(@cruiser)
      expect(@cell_1.empty?).to eq(false)
    end
  end

  describe '#cell_1 being fired upon' do
    it 'does fired_upon work' do
      @cell_1.place_ship(@cruiser)

      expect(@cell_1.fired_upon?).to eq(false)

      @cell_1.fire_upon

      expect(@cell_1.ship.health).to eq(2)
      expect(@cell_1.fired_upon?).to eq(true)
    end
  end

  describe '#render' do
    it 'returns expected visual on board' do
      expect(@cell_1.render).to eq('.')
      @cell_1.fire_upon
      expect(@cell_1.render).to eq('M')

      @cell_2.place_ship(@cruiser)
      expect(@cell_2.render).to eq('.')

      expect(@cell_2.render(true)).to eq('S')

      @cell_2.fire_upon

      expect(@cell_2.render).to eq('H')
      expect(@cruiser.sunk?).to eq(false)
      
      @cruiser.hit
      @cruiser.hit

      expect(@cruiser.sunk?).to eq(true)
      expect(@cell_2.render).to eq('X')
    end
  end
end