require_relative '../../lib/game_logic'

module TicTacToe

  describe GameLogic do

    # valid_cell? method testing =======================================================================
    describe "#valid_cell?" do

      # The cell is empty and the user input is a valid position
      it "Check if the cell is a valid position - Should return true" do
        game_logic = GameLogic.new
        expect(game_logic.valid_cell?('1')).to eql(true)
      end

      # The cell is not a number
      it "Check if the cell is a valid position - Should return false" do
        game_logic = GameLogic.new
        expect(game_logic.valid_cell?('this a string!')).to eql(false)
      end

      # The cell is empty
      it "Check if the cell is a valid position - Should return false" do
        game_logic = GameLogic.new
        expect(game_logic.valid_cell?('')).to eql(false)
      end

      # The cell is occupied and the user input is a valid position
      it "Check if the cell is a valid position - Should return false" do
        game_logic = GameLogic.new
        player = instance_double("John", :letter => 'X')
        game_logic.set_position(2, player)
        expect(game_logic.valid_cell?('2')).to eql(false)
      end

      # The cell is a negative number
      it "Check if the cell is a valid position - Should return false" do
        game_logic = GameLogic.new
        expect(game_logic.valid_cell?('-3')).to eql(false)
      end

      # The cell is a number greater than 10
      it "Check if the cell is a valid position - Should return false" do
        game_logic = GameLogic.new
        expect(game_logic.valid_cell?('12')).to eql(false)
      end

    end

    # FUNCTIONNAME method testing =======================================================================

    
  end

end