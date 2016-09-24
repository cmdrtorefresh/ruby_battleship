require_relative 'board'
require 'colorize'

class Communication

  def initialize
    welcome
    explain_ships
  end

  def welcome
    puts
    puts "Welcome to Battleship!"
    puts
  end

  def explain_ships
    puts "There are 5 ships hidden in the 10 x 10 board: 1 x 5 cells, 1 x 4 cells, 2 x 3 cells, and 1 x 2 cells."
    puts
  end

  def get_coordinates(board)
    puts "Pick a coordinate pair to guess!"
    row = board.row_no + 1
    column = board.column_no + 1
    while !is_row_col_answer_valid?(row)
      print "Pick a row, an Integer between 1 and 10! "
      row = gets.chomp.to_i
    end

    while !is_row_col_answer_valid?(column)
      print "Pick a column, an Integer between 1 and 10! "
      column = gets.chomp.to_i
    end

    puts "You picked row " + row.to_s + ", column " + column.to_s + "."
    puts

    return [row, column]
  end

  # def ask_for_dimension
  #   puts "Please specify the board dimension. At least 8 x 8!"
  #   row = 0
  #   col = 0
  #
  #   while !is_row_col_answer_valid?(row)
  #     puts "Number of rows?"
  #     row = gets.chomp.to_i
  #   end
  #
  #   while !is_row_col_answer_valid?(col)
  #     puts "Number of columns?"
  #     col = gets.chomp.to_i
  #   end
  #
  #   return [row, col]
  # end


  def is_row_col_answer_valid?(number)
    return true if number <= 10
    return false
  end

  def describe_guess_impact(guess)
    if guess == :hit
      puts "It's a hit!".colorize(:red)
      puts
    elsif guess == :miss
      puts "You missed!".colorize(:blue)
      puts
    elsif guess == :sink
      puts "Whoaaa! You just sunk a ship!".colorize(:red)
      puts
    end
    puts
  end

  def indicate_win
    puts "YOU WIN BATTLESHIP!!".colorize(:red)
    puts
  end

end
