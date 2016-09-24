require_relative 'board'

class Ship

  attr_reader :size, :orientation, :coordinates, :sunk

  def initialize(size)
    @size = size
    @orientation = rand(0..1) # 0 for horizontal, 1 for vertical
    @sunk = false
  end

  def set_coordinates(board)
    max_first_row = board.row_no
    max_first_col = board.column_no
    if @orientation == 0 # If ship is horizontal
      max_first_col = board.column_no - @size + 1
    else # If ship is vertical
      max_first_row = board.row_no - @size + 1
    end

    requirements_fulfilled = false
    @coordinates = []

    while !requirements_fulfilled
      first_row = rand(1..max_first_row)
      first_col = rand(1..max_first_col)

      @coordinates = []

      @size.times do |x|
        if @orientation == 0
          coordinate = [first_row, (first_col + x)]
          break if does_coordinate_has_ship?(coordinate[0], coordinate[1], board)
          @coordinates.push(coordinate)
        else
          coordinate = [(first_row + x), first_col]
          break if does_coordinate_has_ship?(coordinate[0], coordinate[1], board)
          @coordinates.push(coordinate)
        end
      end
      requirements_fulfilled = true if @coordinates.size == @size
    end
    p @coordinates
    return @coordinates
  end

  def does_coordinate_has_ship?(row, column, board)
    coordinate = row.to_s + "," + column.to_s
    return true if board.status[coordinate].ship != nil
    return false
  end

  def check_is_ship_sunk?(board)
    @coordinates.each do |coord|
      coordinate = coord[0].to_s + "," + coord[1].to_s
      return false if !board.status[coordinate].guessed
    end
    return true
  end

  def sink_ship
    @sunk = true
  end

end
