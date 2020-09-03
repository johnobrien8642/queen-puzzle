
class ValidMoves

    def initialize

    


def reposition(row, col)
    cur_x, cur_y = row, col
    valid_moves = []

    DELTA.each do |(d_x, d_y)|
        new_pos = [cur_x + d_x, cur_y + d_y]

        if new_pos.all? { |coord| coord.between?(0, grid.length - 1) }
            valid_moves << new_pos
        end
    end

    

    valid_moves.each do |pos|
        new_row, new_col = pos
        if safe_pos?(new_row, new_col) && Move.new([new_row, new_column], self.grid).empty?
            grid[cur_x][cur_y] = Token.new("_")
            grid[new_row][new_col] = Token.new("Q")
            grid.delete([cur_x, cur_y])
            grid.push([new_row, new_col])
            return true
        end
    end    
    false
  end
  

end