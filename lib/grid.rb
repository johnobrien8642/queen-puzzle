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
