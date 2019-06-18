require_relative "requirements"

class King < Piece
  include Stepable
  def initialize(pos,board,color)
    super(pos,board, color)
  end

  def symbol
    :K
  end

  def move_diffs
    arr = [
      [1,1],
      [-1,1],
      [-1,-1],
      [1,-1],
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0], 
    ]
  end
end