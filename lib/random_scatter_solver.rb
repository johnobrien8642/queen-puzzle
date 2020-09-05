require_relative "grid"
require_relative "move"
require_relative "console_printer"
require 'byebug'


class RandomScatterSolver


  def initialize(n)
    @grid = Grid.new(n)
    @queen_pos = Array.new
  end

  def solve
    place_all_queens_anywhere

    reposition_until_all_queens_safe
  end

  attr_accessor :grid, :queen_pos

  def place_all_queens_anywhere
    until queen_pos.length == grid.length
      random_pos = pick_random_pos
      if grid.place_queens_anywhere(*random_pos)
        queen_pos << random_pos
      else
        redo
      end
    end
  end

  def reposition_until_all_queens_safe
    debugger
    row = 0
    col = 0
    until finished?
      if grid[row][col].queen? && in_bounds?(row, col)
        if safe_pos?(row, col)
          col += 1
        else
          redo if reposition_queen(row, col)
          col += 1
        end
      else 
        col += 1
        if col > grid.length - 1
          row += 1
          col = 0
        elsif row > grid.length - 1
          row = 0 
          col = 0
        end
      end
    end
  end

  def finished?
    queen_pos.all? do |pos|
        row, column = pos
        safe_pos?(row, column)
    end
  end

  def in_bounds?(row, col)
    (row >= 0 && row < grid.length) &&
    (col >= 0 && col < grid.length)
  end

  def pick_random_pos
    idx1 = rand(0...grid.length)
    idx2 = rand(0...grid.length)

    [idx1, idx2]
  end


  def print
    check = ConsolePrinter.new(grid)
    check.print
  end
end
