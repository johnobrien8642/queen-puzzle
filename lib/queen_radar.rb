

class QueenRadar
  def initialize(position:, delta:, to:)
    @row, @column = position
    @row_delta, @column_delta = delta
    @to_row, @to_column = to
  end

  def any?
    count = 1
    return false if border_reached?
    count 
    true
  end

  private

  attr_reader :row, :column, :row_delta, :column_delta, :to_row, :to_column


end
