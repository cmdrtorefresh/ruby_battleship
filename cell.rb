require_relative 'ship'

class Cell

  attr_reader :ship, :guessed, :display

  def initialize(row, column)
    @row = row
    @column = column
    @board = board
    @ship = nil
    @guessed = false
    @display = "."
  end

  def assign_ship(ship)
    @ship = ship
  end

  def guess
    @guessed = true
    change_display
  end

private

  def sink_cell
    @display = "🔥"
  end

  def change_display
    if @ship != nil
      if is_ship_sunk?
        sink_cell
      end
    else
      @display = "-"
    end
  end

  def is_ship_sunk?
    return @ship.is_sunk?
  end

  def other_cells_same_ship
    return @ship.coordinates.reject {|x| x = [@row, @column]}
  end

  def sink_other_cells
    other_cells_same_ship.each do |coord|
      @ship.board.coor
  end

end
