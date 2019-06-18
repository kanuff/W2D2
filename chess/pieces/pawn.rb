require_relative "requirements"

class Pawn < Piece

  def initialize(pos, board, color)
    @start_pos = pos
    super(pos, board, color)
  end

  def symbol
    :p
  end

  def move_dirs
    possible_moves = forward_steps + side_attacks
  end


  private
  def at_start_row?
    case color 
    when :green
      return true if pos[0] = 1
    when :white 
      return true if pos[0] = 6
    end 
    false
  end

  def forward_dir
    if color == :green
      -1
    else
      1
    end
  end

  def forward_steps
    forward_moves = [forward_dir, 0]
    if at_start_row
      forward_moves += [forward_dir * 2, 0]
    end
    forward_moves.select! {|position| board.valid_pos?(position)}
    forward_moves.select! {|position| board[position].color == :magenta}
  end

  def side_attacks
    x, y = current_pos 
    possible_attacks = []
    case color 
    when :green 
      possible_attacks = [[x-1, y-1], [x-1, y+1]]
    when :white 
      possible_attacks = [[x+1, y-1], [x+1, y+1]]
    end 
    possible_attacks
    possible_attacks.select! {|position| board.valid_pos?(position)}
    possible_attacks.reject! {|position| board[position].color == self.color || board[position].color = :magenta}
  end
end