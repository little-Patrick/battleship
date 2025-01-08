require 'rspec'
require 'pry'
require './lib/ship'

RSpec.describe Ship do
    before(:each) do
        @cruiser = Ship.new("Cruiser", 3)
    end

    describe 'exists' do
        it 'is a ship' do
            expect(@cruiser).to be_an_instance_of(Ship)
        end
    end

    describe 'initialized traits' do
        it 'can read initialized traits' do
            expect(@cruiser.name).to eq("Cruiser")
            expect(@cruiser.length).to eq(3)
            expect(@cruiser.health).to eq(3)
        end
    end

    describe 'sunk? and hit' do
        it 'ability to get hit and keep track if still afloat' do
            expect(@cruiser.sunk?).to eq(false)

            @cruiser.hit

            expect(@cruiser.health).to eq(2)

            @cruiser.hit

            expect(@cruiser.health).to eq(1)
            expect(@cruiser.sunk?).to eq(false)

            @cruiser.hit

            expect(@cruiser.sunk?).to eq(true)
        end

        it 'ability to repair' do
            @cruiser.hit
            @cruiser.hit
            expect(@cruiser.health).to eq(1)
            
            @cruiser.repair

            expect(@cruiser.health).to eq(3)
        end
    end
end