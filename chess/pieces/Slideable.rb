module Slideable
  private 
  HORIZONTAL_DIRS = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
  ]
  DIAGONAL_DIRS = [
    [1, 1],
    [-1, 1],
    [-1, 1],
    [-1, -1]
  ]

  public
  def moves
    case move_dirs
    when :Q
      dirs = horizontal_dirs + diagonal_dirs
    when :B
      dirs = diagonal_dirs
    when :R 
      dirs = horizontal_dirs
    end 
    possible_moves = []
    dirs.each do |dir|
      dx, dy = dir
      possible_moves += grow_unblocked_moves_in_dir(dx, dy)
    end
    possible_moves
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  private
  def move_dirs
    raise 
  end

  def grow_unblocked_moves_in_dir(dx,dy)
    x,y = current_pos
    step = [x+dx, y+dy]
    possible_moves = []
    until board[step].color == self.color || !board.valid_pos?(step)
      possible_moves << step
      break if board[step].color != :magenta
      step[0] += dx 
      step[1] += dy
    end
    possible_moves
  end

end