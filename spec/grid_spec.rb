require_relative '../lib/grid'

describe Grid do
  it "does not place queen if queen is already in upper left diagonal" do
    grid = Grid.new(4)
    grid.place_queen(0, 2)

    result = grid.place_queen(1, 3)

    expect(result).to eq(false)
  end

  it "does not place queen if queen is already in lower right diagonal" do
    grid = Grid.new(4)
    grid.place_queen(1, 3)

    result = grid.place_queen(0, 2)

    expect(result).to eq(false)
  end

  it "does not place queen if queen is already in upper right diagonal" do
    grid = Grid.new(4)
    grid.place_queen(0, 2)

    result = grid.place_queen(1, 1)

    expect(result).to eq(false)
  end

  it "does not place queen if queen is already in lower left diagonal" do
    grid = Grid.new(4)
    grid.place_queen(1, 1)
    
    result = grid.place_queen(0, 2)

    expect(result).to eq(false)
  end
end
