require_relative "board.rb"
require_relative "tile.rb"

class Sudoku

  def initialize
    @board = Board.new

  end

  def setup
    @board.build_grid
  end

  def play
    setup
    until @board.solved?
      @board.render
      pos = get_position
      val = get_value
      @board[pos].value = val

    end
    puts "You win!"
  end

  def get_position
    puts "Enter a position:"
    gets.chomp.split(",").map(&:to_i)
  end

  def get_value
    puts "Enter a value"
    gets.chomp.to_i
  end


end

if __FILE__ == $0
  Sudoku.new.play

end
