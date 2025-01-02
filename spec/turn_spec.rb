require "./spec/spec_helper.rb"
require './lib/turn.rb'

RSpec.describe Turn do
  before(:each) do
    @turn = Turn.new
  end

  describe 'initialize' do 
    it "exists" do
      expect(@turn).to be_an_instance_of(Turn)
    end
  end
end