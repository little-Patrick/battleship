require 'pry'
require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new('B4')
    @cruiser = Ship.new('Cruiser', 3)
  end
end