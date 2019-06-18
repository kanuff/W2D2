require_relative "requirements"
# require "byebug"

class Pawn < Piece

  def initialize(pos, board, color)
    super(pos, board, color)
  end

  def symbol
    :p
  end

  #move_dirs?
  def moves
    possible_moves = forward_steps + side_attacks
    # debugger
  end


  private
  def at_start_row?
    case color 
    when :green
      return true if current_pos[0] == 1
    when :white 
      return true if current_pos[0] == 6
    end 
    false
  end

  def forward_dir
    if color == :green
      1
    else
      -1
    end
  end

  def forward_steps
    x, y = current_pos
    forward_moves = [[x+forward_dir, y+0]]
    if at_start_row?
      forward_moves << [x+(forward_dir * 2), y+0]
    end
    forward_moves.select! {|position| board.valid_pos?(position)}
    forward_moves.select! {|position| board[position].empty?}
    forward_moves
  end

  def side_attacks
    x, y = current_pos 
    possible_attacks = []
    case color 
    when :white 
      possible_attacks = [[x-1, y-1], [x-1, y+1]]
    when :green 
      possible_attacks = [[x+1, y-1], [x+1, y+1]]
    end 
    # debugger
    possible_attacks.select! {|position| board.valid_pos?(position)}
    # debugger
    possible_attacks.reject! {|position| board[position].color == self.color || board[position].empty?}
    possible_attacks
    # debugger
  end
end