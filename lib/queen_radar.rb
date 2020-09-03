require_relative "token"

class QueenRadar
  

  def initialize(position:, delta:, to:, grid)
    @row, @column = position
    @row_delta, @column_delta = delta
    @to_row, @to_column = to
    @grid = grid
  end

  def returns_1_if_queen_found
    count = 0
        update_row, update_col = update_position
        if grid[update_row][update_col].queen?
            count += 1
            return count
        elsif border_reached?
            return count
        end
    end

  DELTA = [
    [0, 1],
    [1, 1],
    [1, 0],
    [1, -1],
    [0, -1],
    [-1, -1],
    [1, 0]
    ]

  def self.count(position, size)
      QueenRadar.new(position: position, delta: [0, 1], to: [0, size]).returns_1_if_queen_found +
      QueenRadar.new(position: position, delta: [1, 1], to: [size, size]).returns_1_if_queen_found +
      QueenRadar.new(position: position, delta: [1, 0], to: [size, 0]).returns_1_if_queen_found +
      QueenRadar.new(position: position, delta: [-1, -1], to: [0, 0]).returns_1_if_queen_found +
      QueenRadar.new(position: position, delta: [0, -1], to: [0, 0]).returns_1_if_queen_found +
      QueenRadar.new(position: position, delta: [-1, -1], to: [0, 0]).returns_1_if_queen_found +
      QueenRadar.new(position: position, delta: [-1, 0], to: [0, 0]).returns_1_if_queen_found
    end


  private

  attr_reader :row, :column, :row_delta, :column_delta, :to_row, :to_column


end
