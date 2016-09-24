require_relative 'ship'
require_relative 'cell'

class Board

  attr_accessor :row_no, :column_no
  attr_reader :ships, :status, :com, :last_guess

  def initialize(board_dim)
    @row_no = board_dim[0]
    @column_no = board_dim[1]
    @status = {}
    @ships = {}
    @last_guess = nil
    set_initial_status
    display_board
  end

  def set_initial_status
    #Row first, then column. status[3,2] = ., X, or -
    @row_no.times do |r|
      @column_no.times do |c|
        coordinate = (r+1).to_s + "," + (c+1).to_s
        cell = Cell.new(r+1, c+1, self)
        @status[coordinate] = cell
      end
    end
  end

  def create_ships
    ship_sizes = [5,4,3,3,2]
    ships = ship_sizes.each { |x| create_ship(x, self) }
  end

  def create_ship(size, board)
    ship = Ship.new(size)
    coordinates = ship.set_coordinates(board)
    place_ship(ship.object_id, coordinates)
    @ships[ship.object_id] = ship
  end

  def place_ship(ship_id, coordinates)
    coordinates.each do |x|
      coordinate = x[0].to_s + "," + x[1].to_s
      @status[coordinate].assign_ship(ship_id)
    end
  end

  def reveal(row, column)
    coordinate = row.to_s + "," + column.to_s
    @status[coordinate].guess
    display_board if @status[coordinate].ship == nil
  end

  def update_last_guess_to_miss
    @last_guess = :miss
  end

  def check_if_ship_sunk(ship_id)
    @last_guess = :hit
    if @ships[ship_id].check_is_ship_sunk?(self)
      sink_ship(ship_id)
      @last_guess = :sink
    end
    display_board
  end

  def sink_ship(ship_id)
    @ships[ship_id].sink_ship
    @ships[ship_id].coordinates.each do |coord|
      coordinate = coord[0].to_s + "," + coord[1].to_s
      @status[coordinate].sink_cell
    end
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
        cell_status = @status[coordinate].display
        this_row += cell_status + " "
      end

      puts this_row
    end
    puts
  end

end
