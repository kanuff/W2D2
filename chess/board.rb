require_relative "pieces/requirements"


class NoPieceError < StandardError
end

class InvalidMoveError < StandardError
end

class Board
  attr_reader :rows
  def initialize
    @rows = Array.new(8) {Array.new()}
    @nullPiece = NullPiece.instance

    # @rows.each_with_index do |row, idx|
    #   if idx.between?(0,1) || idx.between?(6,7)
    #     8.times do |i|
    #       row << Piece.new([idx, i], self, :white)
    #     end
    #   else
    #     8.times do |i|
    #       row << @nullPiece
    #     end
    #   end
    # end


    @rows.each_with_index do |row, idx|
      if idx == 1 #green
        8.times do |i|
          row << Pawn.new([idx,i], self, :green)
        end
      elsif idx == 6 #white
        8.times do |i|
          row << Pawn.new([idx,i], self, :white)
        end
      elsif idx == 0 #green
        row << Rook.new([0,0], self, :green)
        row << Knight.new([0,1], self, :green)
        row << Bishop.new([0,2], self, :green)
        row << Queen.new([0,3], self, :green)
        row << King.new([0,4], self, :green)
        row << Bishop.new([0,5], self, :green)
        row << Knight.new([0,6], self, :green)
        row << Rook.new([0,7], self, :green)
      elsif idx == 7 #white
        row << Rook.new([7,0], self, :white)
        row << Knight.new([7,1], self, :white)
        row << Bishop.new([7,2], self, :white)
        row << Queen.new([7,3], self, :white)
        row << King.new([7,4], self, :white)
        row << Bishop.new([7,5], self, :white)
        row << Knight.new([7,6], self, :white)
        row << Rook.new([7,7], self, :white)
      else
        8.times do |i|
          row << @nullPiece
        end
      end
    end
  end


  def[](pos)
    x,y = pos
    @rows[x][y]
  end

  def[]=(pos, val)
    x,y = pos
    @rows[x][y] = val
  end

  def move_piece(color, start_pos, end_pos)
    if self[start_pos] == @nullPiece
      raise NoPieceError
    elsif valid_pos?(end_pos) && self[start_pos].valid_moves.include?(end_pos)
      temp_piece = self[start_pos]
      self[start_pos] = @nullPiece
      self[end_pos] = temp_piece
      temp_piece.pos = end_pos
    else  
      raise InvalidMoveError
    end
  end

  def valid_pos?(pos)
    x,y = pos
    return false unless x.between?(0,7)
    return false unless y.between?(0,7)
    true
  end
end
