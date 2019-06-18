require_relative "requirements"

class Rook < Piece
  include Slideable
  def intialize(pos, board, color)
    super(pos, board, color)
  end

  def symbol
    :R
  end

  protected
  def move_dirs
    symbol
  end
end