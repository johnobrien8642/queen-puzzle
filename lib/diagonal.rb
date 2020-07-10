class Diagonal
  def initialize(position:, delta:, to:)
    @row, @column = position
    @row_delta, @column_delta = delta
    @to_row, @to_column = to
  end

  def all
    [].tap do |result|
      result << update_position until border_reached?
    end
  end

  def self.for(position, size)
    Diagonal.new(position: position, delta: [-1, -1], to: [0, 0]).all +
      Diagonal.new(position: position, delta: [1, 1], to: [size, size]).all +
      Diagonal.new(position: position, delta: [-1, 1], to: [0, size]).all +
      Diagonal.new(position: position, delta: [1, -1], to: [size, 0]).all
  end

  private

  attr_reader :row, :column, :row_delta, :column_delta, :to_row, :to_column

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
