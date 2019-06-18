require_relative "board"
require_relative "cursor"
require 'colorize'

class Display
  attr_reader :board, :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  def render 
    @board.rows.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        current_pos = [row_i, col_i]
        if current_pos == @cursor.cursor_pos
          print board[current_pos].to_s.colorize(:background => :light_blue)
          print " "
        else
          background_color = :black
          background_color = :light_black if col_i.even? && row_i.even?
          background_color = :light_black if col_i.odd? && row_i.odd?
          print board[current_pos].to_s.colorize(:background => background_color)
          print " "
        end
      end
      puts
    end 
  end

end

board = Board.new
display = Display.new(board)
while true
  system("clear")
  display.render
  display.cursor.get_input
  puts
end
