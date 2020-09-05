require_relative "queen_radar"

class ValidMoves

    DELTAS = [
      [0, 1],
      [1, 1],
      [1, 0],
      [1, -1],
      [0, -1],
      [-1, -1],
      [-1, -0]
  ]

  def initialize(position:, grid)
    @row, @column = position
    @grid = grid
  end

  def next_valid_move 
    moves = valid_moves_with_queen_scores_hash
    if moves.values.all? { |val| val.eql?(val) } return false
    # hash sort_by returns 2D array
    sorted_moves_by_score = moves.sort_by { |move, val| val }
    sorted_moves_by_score[0][0]
  end

    
  private

  attr_reader :row, :column, :grid

  def valid_moves_with_queen_score_hash(row, col)
    cur_x, cur_y = row, col
    valid_moves = []
    valid_moves_with_queen_scores = Hash.new

    DELTAS.each do |(d_x, d_y)|
        new_pos = [cur_x + d_x, cur_y + d_y]

        new_pos.all? do |coord| 
            coord.between?(0, grid.length - 1) && 
            Move.new([coord[0], coord[1]], self.grid).empty?
            valid_moves << new_pos
        end
    end

    if valid_moves.empty? return false

    valid_moves.each do |pos|
        valid_moves_with_queen_scores[move] = queen_score(pos[0], pos[1])
    end

    valid_moves_with_queen_scores
end


  def queen_score(row, column)
    QueenRadar.for([row, column], size, grid).inject(0) { |count, if_queen_found| count += if_queen_found }
  end
end