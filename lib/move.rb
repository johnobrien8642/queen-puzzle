require_relative "diagonal"
require_relative "valid_moves"

class Move
  def initialize(position, grid)
    @row, @column = position
    @grid = grid
  end

  def invalid?
    queen_in_col? || queen_in_row? || queen_in_diagonal?
  end

  def next_move
    return false if !get_next_move
    [
      get_next_move[0],
      get_next_move[1]
    ]
  end

  private

  attr_reader :row, :column, :grid

  def size
    grid.length - 1
  end

  def queen_in_row?
    grid[row].any?(&:queen?)
  end

  def queen_in_col?
    transposed_grid[column].any?(&:queen?)
  end

  def transposed_grid
    grid.transpose
  end

  def queen_in_diagonal?
    Diagonal.for([row, column], size).any? { |pos| grid[pos[0]][pos[1]].queen? }
  end

  def get_next_move 
    ValidMoves.new([row, column], self.grid).next_valid_move unless false
    false
  end

end
