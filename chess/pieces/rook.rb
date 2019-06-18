require_relative "requirements"

class Rook < Piece
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