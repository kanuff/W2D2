require_relative "requirements"

class Queen < Piece
  include Slideable
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