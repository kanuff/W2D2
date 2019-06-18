require_relative "requirements"

class Knight < Piece
  include Stepable
  def initialize(pos,board,color)
    super(pos, board, color)
  end

  def symbol
    :N
  end

  def move_diffs
    arr = [
      [1,2],
      [-1,2],
      [-1,-2],
      [1,-2],
      [2,1],
      [2,-1],
      [-2,-1],
      [-2,1]
    ]
  end
end