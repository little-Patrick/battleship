require './lib/board'
require './spec/spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
   
  end

  it 'exists' do 
    expect(@board).to be_an_instance_of(Board)
  end

  it 'has a cells that make up board' do
    
    expect(@board.cells.count).to eq(16)
  end
end