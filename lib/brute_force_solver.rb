require "set"
require_relative "grid"
require_relative "console_printer"

class BruteForceSolver
  def initialize(n)
    @grid = Grid.new(n)
    @invalid_pos = Set.new
    @queen_pos = Set.new
  end

  def solve
    raise "No solution for grids smaller 4" if grid.length < 4

    until solved?
      place_queen
      reset unless valid_move_possible?
    end
    grid
  end

  def print
    ConsolePrinter.new(grid).print
  end
  
  private

  attr_reader :invalid_pos, :queen_pos, :grid

  def place_queen
    random_pos = pick_random_pos

    if grid.place_queen(*pick_random_pos)
      queen_pos << random_pos
    else
      invalid_pos << random_pos
    end
  end

  def pick_random_pos
    idx1 = rand(0...grid.length)
    idx2 = rand(0...grid.length)

    [idx1, idx2]
  end

  def reset
    @grid = Grid.new(grid.length)
    @invalid_pos = Set.new
    @queen_pos = Set.new
  end

  def valid_move_possible?
    invalid_pos.length < grid.max_invalid_positions
  end

  def solved?
    queen_pos.size == grid.length
  end
end
