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
# knight = Knight.new([0,1], board, :white)
# board[[0,1]] = knight
# p knight.moves
# sleep(10)
while true
  system("clear")
  display.render
  begin
    input = display.cursor.get_input
    if input
    
      start_pos = input
      board[start_pos].valid_moves
      # sleep(1)
      end_pos = nil
      until end_pos
        system("clear")
        display.render
        end_pos = display.cursor.get_input
      end
      board.move_piece(board[start_pos].color, start_pos, end_pos)
    end
  rescue NoPieceError
    puts "You didn't select a piece go again"
    retry
  rescue InvalidMoveError
    puts "Invalid Move go again"
    retry
  end
  puts
end
