require 'Singleton'

class NullPiece < Piece
  attr_reader :color
  include Singleton

  def initialize
    @color = :magenta
  end

  def moves
  end


  def symbol
    :" "
  end

end