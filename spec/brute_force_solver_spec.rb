require_relative '../lib/brute_force_solver'

describe BruteForceSolver do
    it "raises error if grid is smaller than 4" do
        test_grid = BruteForceSolver.new(3)

        expect{ test_grid.solve }.to raise_error(RuntimeError, "No solution for grids smaller than 4")
    end

    it "returns true when solved" do
        test_grid = BruteForceSolver.new(4)

        expect(test_grid.solve).to eq(true)
    end
end
