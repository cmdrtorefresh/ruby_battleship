require_relative 'board'
require_relative 'ship'
require_relative 'communication'

class Game

  attr_accessor :board, :com

  def initialize
    @com = Communication.new

    game_set_up
  end

  def game_set_up
    @board = Board.new([10,10])
    place_ships


  end

  def place_ships
    @board.create_ship
  end

end

g = Game.new
