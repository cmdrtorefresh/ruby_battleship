require_relative 'board'
require_relative 'ship'
require_relative 'communication'

class Game

  attr_accessor :board, :com

  def initialize
    @com = Communication.new

    game_set_up

    while !is_game_over?
      get_answer_and_update_board
    end
  end


  def game_set_up
    @board = Board.new([10,10])
    place_ships
  end

  def get_answer_and_update_board
    guess = @com.get_coordinates(@board)
    @board.reveal(guess[0], guess[1])
    @com.describe_guess_impact(@board.last_guess)
  end

  def is_game_over?
    @board.ships.values.each do |ship|
      return false if !ship.sunk
    end
    @com.indicate_win
    return true
  end

private

  def place_ships
    @board.create_ships
  end

end

g = Game.new
