require_relative "token"
require "byebug"

class QueenRadar
  

  def initialize(position:, delta:, to:, grid:)
    @row, @column = position
    @row_delta, @column_delta = delta
    @to_row, @to_column = to
    @grid = grid
  end

  

  def self.for(position, size, grid)
      QueenRadar.new(position: position, delta: [0, 1], to: [0, size], grid: grid).all +
      QueenRadar.new(position: position, delta: [1, 1], to: [size, size], grid: grid).all +
      QueenRadar.new(position: position, delta: [1, 0], to: [size, 0], grid: grid).all +
      QueenRadar.new(position: position, delta: [1, -1], to: [0, size], grid: grid).all +
      QueenRadar.new(position: position, delta: [0, -1], to: [0, 0], grid: grid).all +
      QueenRadar.new(position: position, delta: [-1, -1], to: [0, 0], grid: grid).all +
      QueenRadar.new(position: position, delta: [-1, 0], to: [0, 0], grid: grid).all
  end

  def all
    [].tap do |result|
      result << returns_1_if_queen_found
    end
  end


  private

  attr_reader :row, :column, :row_delta, :column_delta, :to_row, :to_column, :grid

  def returns_1_if_queen_found
    count = 0
        
        unless border_reached?
        update_row, update_col = update_position
          if grid[update_row][update_col] == "Q"
            count += 1
            return count
          end
        end
    count
  end

  def in_bounds?(row, col)
    (row >= 0 && row < grid.length) &&
    (col >= 0 && col < grid.length)
  end

  def update_position
    [
      update_row,
      update_column
    ]
  end

  def update_row
    @row += row_delta
  end

  def update_column
    @column += column_delta
  end

  def border_reached?
    row == to_row ||
      column == to_column
  end

end
