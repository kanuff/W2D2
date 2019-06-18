require_relative "requirements"

class Bishop < Piece
  include Slideable
  def intialize(pos, board, color)
    super(pos, board, color)
  end

  def symbol
    :B
  end

  protected
  def move_dirs
    symbol
  end
end