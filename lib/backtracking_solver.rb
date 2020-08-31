require "set"
require_relative "grid"

class BacktrackingSolver

  def initialize(n)
    @grid = Grid.new(n)
    @invalid_pos = Set.new
    @queen_pos = Set.new
  end

  def solve
    until solved?
        if !valid_move_possible
            backtrack
        else
            place_queen
        end
    end
  end

end
