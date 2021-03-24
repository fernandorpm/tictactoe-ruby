module TicTacToe
  class GameLogic
    attr_reader :result, :game_is_on, :board

    def initialize
      @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      @game_is_on = true
      @winner_letter = ''
      @result = ''
    end

    # PUBLIC METHODS ==================================================

    def valid_cell?(cell)
      cell !~ /\D/ && !cell.empty? && @board[cell.to_i - 1] !~ /\D/ ? true : false
    end

    def set_position(cell, player)
      @board[cell - 1] = player.letter
      check(player)
    end

    def show_board
      "+---+---+---+\n| #{@board[0]} | #{@board[1]} | #{@board[2]} |\n+---+---+---+\n| #{@board[3]} | #{@board[4]} | #{@board[5]} |\n+---+---+---+\n| #{@board[6]} | #{@board[7]} | #{@board[8]} |\n+---+---+---+\n\n"
    end

    # PRIVATE METHODS =================================================

    private

    def win(player_name)
      @result = "\nCONGRATULATIONS!\n\n#{player_name}, you WIN the game!"
    end

    def tie
      @result = "\nIt's a TIE!\n\nGame is Over! That was a great game!"
    end

    def check(player)
      if @board[0] == @board[1] && @board[0] == @board[2]
        @winner_letter = @board[0]

      elsif @board[0] == @board[3] && @board[3] == @board[6] || @board[0] == @board[4] && @board[4] == @board[8]
        @winner_letter = @board[0]

      elsif @board[1] == @board[4] && @board[1] == @board[7]
        @winner_letter = @board[1]

      elsif @board[2] == @board[4] && @board[2] == @board[6] || @board[2] == @board[5] && @board[2] == @board[8]
        @winner_letter = @board[2]

      elsif @board[3] == @board[4] && @board[3] == @board[5]
        @winner_letter = @board[3]

      elsif @board[6] == @board[7] && @board[6] == @board[8]
        @winner_letter = @board[6]

      end

      if @winner_letter.length == 1
        @game_is_on = false
        win(player.name)

      elsif @board.none?(Numeric)
        @game_is_on = false
        tie
      end
    end
  end
end
