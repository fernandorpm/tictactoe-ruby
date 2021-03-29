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

    # set_position method testing =======================================================================
    describe "#set_position" do

      # If game incomplete or no winner, game will continue
      it "Returns nil if there's no winner or the game is incomplete" do
        game_logic = GameLogic.new
        player1 = instance_double("John", :letter => 'X')
        expect(game_logic.set_position(2, player1)).to eql(nil)
      end

      # player one wins. Meet one of the criteria for winning. Game stops
      it "Returns string including 'CONGRATULATIONS!' if there's a winner" do
        game_logic = GameLogic.new
        player1 = instance_double("player_1",:name => "John", :letter => 'X')
        player2 = instance_double("Maria", :letter => 'O')
        game_logic.set_position(1, player1)
        game_logic.set_position(2, player1)
        expect(game_logic.set_position(3, player1)).to include("CONGRATULATIONS!")
      end

      # Game complete. No winner. Game stops
      it "Returns string including 'TIE' if there's a draw" do
        game_logic = GameLogic.new
        player1 = instance_double("player_1",:name => "John", :letter => 'X')
        player2 = instance_double("player_2",:name => "Maria", :letter => 'O')
        game_logic.set_position(1, player1)
        game_logic.set_position(2, player2)
        game_logic.set_position(3, player1)
        game_logic.set_position(5, player2)
        game_logic.set_position(6, player1)
        game_logic.set_position(7, player2)
        game_logic.set_position(8, player1)
        game_logic.set_position(4, player2)
        expect(game_logic.set_position(9, player2)).to include("TIE")
      end

    end
  end

end