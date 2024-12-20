require './lib/board'
require './spec/spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end

  it 'exists' do 
    expect(@board).to be_an_instance_of(Board)
  end

  it 'has a board' do
    expect(@board.cell).to eq()
  end
end