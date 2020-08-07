require_relative '../lib/brute_force_solver'
require_relative '../lib/grid'
require_relative '../lib/move'
require 'set'


describe BruteForceSolver do
    it "raises error if grid is smaller than 4" do
        error_grid = BruteForceSolver.new(3)

        expect{ error_grid.solve }.to raise_error(RuntimeError, "No solution for grids smaller than 4")
    end

    let(:grid) { Grid.new(4) }
    
    context "when using randomly generated positions" do
        it "is solved when 4 valid queens have been placed" do
            BruteForceSolver = double("BruteForceSolver")
            allow(BruteForceSolver).to receive(:queen_pos).and_return(Set.new)
                BruteForceSolver.queen_pos << [1, 0]
                BruteForceSolver.queen_pos << [2, 3]
                BruteForceSolver.queen_pos << [0, 2]
                BruteForceSolver.queen_pos << [3, 1]
        
            all_valid_pos = BruteForceSolver.queen_pos.none? { |pos| Move.new([pos[0], pos[1]], grid).invalid? }

            expect(all_valid_pos).to eq(true)
        end

        it "resets grid, invalid_pos, and queen_pos when @invalid_pos.size == @grid.flatten.count - @grid.length (12 in the case of n == 4)" do
            BruteForceSolver = double("BruteForceSolver")
            reset_grid = false
            allow(BruteForceSolver).to receive(:invalid_pos).and_return(Set.new)

            12.times { |el| BruteForceSolver.invalid_pos << el }
    
            if grid.max_invalid_positions == BruteForceSolver.invalid_pos.count
                reset_grid = true
            end
            
            expect(reset_grid).to eq(true)
        end
    end
end
