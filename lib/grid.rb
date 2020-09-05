require "forwardable"
require_relative "move"
require_relative "token"

class Grid
  extend Forwardable
  def_delegators :@store, :each, :length, :[], :transpose

  def initialize(n)
    @store = Array.new(n) { Array.new(n, Token.new("_")) }
  end

  def place_queen(row, column)
    return false if store[row][column].queen? || Move.new([row, column], self).invalid?

    store[row][column] = Token.new("Q")
    true
  end

  def place_queens_anywhere(row, column)
    return false if store[row][column].queen?
    
    store[row][column] = Token.new("Q")
  end

  def reposition_queen(row, column)
    cur_row, cur_col = row, column
    next_pos = Move.new([row, column], self).next_move
    return false if !next_pos
    store[cur_row][cur_col] = Token.new("_")
    store[next_pos[0]][next_pos[1]] = Token.new("Q")
  end

  def max_invalid_positions
    store.flatten.count - length
  end

  def safe_pos?(row, column)
    return false if Move.new([row, column], self.grid).invalid?
    true
  end
  
  private

  attr_reader :store
end
