require './spec/spec_helper.rb'

RSpec.describe VariableBoard do
  before(:each) do
    @board = VariableBoard.new(4, 4)
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  describe 'initialize' do
    it 'exists' do 
      @board = VariableBoard.new(4, 4)
      @cruiser = Ship.new("Cruiser", 3)
      @submarine = Ship.new("Submarine", 2)
      @board.render(true)
      expect(@board).to be_an_instance_of(VariableBoard)
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

  describe 'validating placements' do
    it 'has placement' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
    end

    it 'can read column and row' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
    end

    it "coordinates can't be diagonal" do
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
    end

    it 'can pass when needed' do
      expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", 'A3'])).to eq(true)

    end

    it 'cruiser' do
      expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
    end
  end

  describe 'placing ships' do
    it 'can tell what ship is in what cell' do
      @board.place(@cruiser, ["A1", "A2", "A3"])

      cell_1 = @board.cells["A1"]
      cell_2 = @board.cells["A2"]
      cell_3 = @board.cells["A3"]

      expect(cell_1.ship).to eq(@cruiser)
      expect(cell_2.ship).to eq(@cruiser)
      expect(cell_3.ship).to eq(@cruiser)
    end

    it 'wont overlap ships' do
      @board.place(@cruiser, ["A1", "A2", "A3"])

      cell_1 = @board.cells["A1"]
      cell_2 = @board.cells["A2"]
      cell_3 = @board.cells["A3"]

      expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
    end
  end

  describe 'rendering the board' do
    it 'renders the board' do
    @board.place(@cruiser, ["A1", "A2", "A3"])

    expect(@board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    expect(@board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end
end