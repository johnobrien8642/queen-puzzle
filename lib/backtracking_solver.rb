require_relative "grid"

class BacktrackingSolver
  def initialize(n)
    @grid = Grid.new(n)
    @queen_pos = Array.new
  end

  def solve
    raise "No solution for grids smaller than 4" if grid.length < 4
    
    place_queens
  end

  private 

  attr_reader :invalid_pos, :queen_pos, :grid

  def place_queens
    row = 0
    col = 0
    until solved?
        if !in_bounds?(row, col)
          last_pos = backtrack
          row = last_pos[0] + 1
          col = last_pos[1]
        elsif grid.place_queen(row, col)
          queen_pos << [row, col]
          col += 1
          row = 0
        else
          row += 1
        end
    end
    true
  end

  def in_bounds?(row, col)
    (row >= 0 && row < grid.length) &&
    (col >= 0 && col < grid.length)
  end

  def backtrack
    last_pos = queen_pos[-1]
    grid[last_pos[0]][last_pos[1]] = Token.new("_")
    queen_pos.pop
  end

  def solved?
    queen_pos.size == grid.length
  end
end
