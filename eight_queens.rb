require_relative "lib/console_printer"
require_relative "lib/brute_force_solver"

grid = BruteForceSolver.new(5).solve
ConsolePrinter.new(grid).print

