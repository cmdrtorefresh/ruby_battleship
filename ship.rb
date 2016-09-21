require_relative 'game'

class Ship

  attr_reader :size, :orientation, :coordinates, :game

  def initialize(size, board)
    @size = size
    @orientation = rand(0..1) # 0 for Horizontal, 1 for Vertical
    @board = board
  end

  def set_coordinates
    max_first_row = @board.row_no
    max_first_col = @board.column_no
    if @orientation == 0
      max_first_col = @board.column_no - @size + 1
    else
      max_first_row = @board.row_no - @size + 1
    end

    first_row = rand(1..max_first_row)
    first_col = rand(1..max_first_col)
    
# Randomize first coordinate
# Lay coordinate based on size and orientation
# If ship is_coordinate_unoccupied?, and adopt that coordinate if clear
# Return ship coordinates in array
  end

  def is_coordinate_unoccupied?
# Check with board if one of the ship's coordinates is occupied, return yes, otherwise return no
  end

end
