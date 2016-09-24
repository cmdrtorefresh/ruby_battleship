require_relative 'board'
require 'colorize'

class Cell

  attr_reader :ship, :guessed, :display

  def initialize(row, column, board)
    @row = row
    @column = column
    @board = board
    @ship = nil
    @guessed = false
    @display = "."
  end

  def assign_ship(ship_id)
    @ship = ship_id
  end

  def guess
    @guessed = true
    change_display
    @board.update_last_guess_to_miss
    @board.check_if_ship_sunk(@ship) if @ship != nil
  end

  def sink_cell
    @display = "🔥"
  end


  private

  def change_display
    if @ship != nil
      @display = "X".colorize(:red)
    else
      @display = "o".colorize(:blue)
    end
  end

  def is_ship_sunk?
    return @ship.is_sunk?
  end

end
