require_relative "requirements"

class Piece
  attr_reader :current_pos, :board, :color
  def initialize(current_pos, board, color)
    @current_pos = current_pos
    @board = board
    @color = color
  end

  def inspect
    " P "
  end

  def to_s
    " #{symbol} "
  end

  def symbol
   :P
  end

  def moves
  end
  
end
