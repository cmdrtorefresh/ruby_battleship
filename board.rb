# require_relative 'ship'

class Board

  attr_accessor :row_no, :column_no, :status
  attr_reader :ships, :status

  def initialize(board_dim)
    @row_no = board_dim[0]
    @column_no = board_dim[1]
    @status = {}
    set_initial_status
    display_board
  end

  def set_initial_status
    #Row first, then column. status[3,2] = ., X, or -
    @row_no.times do |r|
      @column_no.times do |c|
        coordinate = (r+1).to_s + "," + (c+1).to_s
        @status[coordinate] = "."
      end
    end
  end

  def create_ships
    ship_sizes = [5,4,3,3,2]
    ships = ship_sizes.each { |x| create_ship(x, self) }
  end

  def create_ship(size, board)
    ship = Ship.new(size, board)
    ship.set_coordinates
  end

  def display_board
    top_row = "   "
    @column_no.times do |c|
      top_row += (c+1).to_s + " "
    end
    puts top_row
    @row_no.times do |r|
      if r+1 < 10
        gap = "  "
      else
        gap = " "
      end

      this_row = (r+1).to_s + gap

      @column_no.times do |c|
        coordinate = (r+1).to_s + "," + (c+1).to_s
        cell_status = @status[coordinate]
        this_row += cell_status + " "
      end

      puts this_row
    end
    puts
  end

end
