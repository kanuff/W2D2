
module Stepable
  def moves
    x, y = current_pos
    possible_moves = []
    move_diffs.each do |move|
      i,j = move
      possible_moves << [x + i, y + j] if (x+i).between?(0,7) && (y+j).between?(0,7)
    end
    possible_moves.select! {|position| board[position].color != self.color}
  end

  private
  def move_diffs
    raise 
  end
end