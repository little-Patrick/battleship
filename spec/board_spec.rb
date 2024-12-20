require './lib/board'
require './spec/spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
   
  end

  describe 'initialize' do
    it 'exists' do 
      expect(@board).to be_an_instance_of(Board)
    end

    it 'has a cells that make up board' do
      expect(@board.cells.count).to eq(16)
    end
  end

  describe 'validating coordinates' do
    it 'has valid coordinate' do
      expect(@board.valid_coordinate?('A1')).to eq(true)
      expect(@board.valid_coordinate?('D4')).to eq(true)
      expect(@board.valid_coordinate?('A5')).to eq(false)
      expect(@board.valid_coordinate?('E1')).to eq(false)
      expect(@board.valid_coordinate?('A22')).to eq(false)

    end

  end

  
end