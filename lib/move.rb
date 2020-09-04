require_relative "diagonal"

class Move
  def initialize(position, grid)
    @row, @column = position
    @grid = grid
  end

  def invalid?
    queen_in_col? || queen_in_row? || queen_in_diagonal?
  end

  def score
    queen_count_for_position
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

  def queen_count_for_position
    QueenRadar.for([row, column], size, grid).inject(0) { |count, if_queen_found| count += if_queen_found }
  end
end
