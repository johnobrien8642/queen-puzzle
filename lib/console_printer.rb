class ConsolePrinter
  def initialize(grid)
    @grid = grid
  end

  def print
    grid.each do |row|
      puts row.join(' ')
    end
  end

  private

  attr_reader :grid
end
