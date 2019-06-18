require_relative "requirements"

class Queen < Piece
  def intialize(pos, board, color)
    super(pos, board, color)
  end

  def symbol
    :Q
  end

  protected
  def move_dirs
    symbol
  end
end