require_relative 'communication'

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
    return true if number.to_i <= 10
    puts "Please input an integer between 1 and 10!"
    puts
    return false
  end


end
