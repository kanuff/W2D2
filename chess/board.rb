require_relative "piece"

class NoPieceError < StandardError
end

class InvalidMove < StandardError
end

class Board
  attr_reader :rows
  def initialize
    @rows = Array.new(8) {Array.new()}

    @rows.each_with_index do |row, idx|
      if idx.between?(0,1) || idx.between?(6,7)
        8.times do |i|
          row << Piece.new
        end
      else
        8.times do |i|
          row << 'x'
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
    if self[start_pos].nil?
      raise NoPieceError
    elsif valid_pos?(end_pos)
      temp_piece = self[start_pos]
      self[start_pos] = nil
      self[end_pos] = temp_piece
    else  
      raise InvalidMove
    end
  end

  def valid_pos?(pos)
    x,y = pos
    return false unless x.between?(0,7)
    return false unless y.between?(0,7)
    true
  end
end
