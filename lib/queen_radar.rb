require_relative "token"

class QueenRadar
  

  def initialize(position:, delta:, to:, grid)
    @row, @column = position
    @row_delta, @column_delta = delta
    @to_row, @to_column = to
    @grid = grid
  end

  

  def self.for(position, size)
      QueenRadar.new(position: position, delta: [0, 1], to: [0, size]).all +
      QueenRadar.new(position: position, delta: [1, 1], to: [size, size]).all +
      QueenRadar.new(position: position, delta: [1, 0], to: [size, 0]).all +
      QueenRadar.new(position: position, delta: [1, -1], to: [0, 0]).all +
      QueenRadar.new(position: position, delta: [0, -1], to: [0, 0]).all +
      QueenRadar.new(position: position, delta: [-1, -1], to: [0, 0]).all +
      QueenRadar.new(position: position, delta: [-1, 0], to: [0, 0]).all
    end

  def all
    [].tap do |result|
      result << returns_1_if_queen_found
    end
  end


  private

  attr_reader :row, :column, :row_delta, :column_delta, :to_row, :to_column

  def returns_1_if_queen_found
    count = 0
        until border_reached?
        update_row, update_col = update_position
          if grid[update_row][update_col].queen?
            count += 1
            return count
          end
        end
    count
  end

end
