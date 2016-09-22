require_relative 'board'

class Ship

  attr_reader :size, :orientation, :coordinates, :game

  def initialize(size, board)
    @size = size
    @orientation = rand(0..1) # 0 for horizontal, 1 for vertical
    @board = board
    @sunk = false
  end

  def set_coordinates
    max_first_row = @board.row_no
    max_first_col = @board.column_no
    if @orientation == 0 # If ship is horizontal
      max_first_col = @board.column_no - @size + 1
    else # If ship is vertical
      max_first_row = @board.row_no - @size + 1
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
          break if does_coordinate_has_ship?(coordinate[0], coordinate[1])
          @coordinates.push(coordinate)
        else
          coordinate = [(first_row + x), first_col]
          break if does_coordinate_has_ship?(coordinate[0], coordinate[1])
          @coordinates.push(coordinate)
        end
      end
      requirements_fulfilled = true if @coordinates.size == @size
    end
    return @coordinates
  end

  def does_coordinate_has_ship?(row, column)
    coordinates = row.to_s + "," + column.to_s
    return true if @board.status[coordinates].ship != nil
    return false
  end

  def is_sunk?
    @coordinates.each do |x|
      coordinate = x[0].to_s + "," + x[1].to_s
      if !@board.status[coordinate].guessed
        @sunk = false
        return false
      end
    end
    return true
  end

end
