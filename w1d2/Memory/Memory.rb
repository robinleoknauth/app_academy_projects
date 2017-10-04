require_relative "Card.rb"
require_relative "Board.rb"

class Game

  def initialize(board_size = 4)
    @board = Board.new(board_size)
  end

  def setup
    @board.populate
    @board.shuffle_board
  end

  def get_guess
    puts "Guess a position"
    gets.chomp.split(",").map(&:to_i)
  end

  def play
    setup
    until @board.won?
      play_turn
    end
    puts "you won!!"
  end

  def play_turn
    puts
    @board.render
    first_guess = get_guess
    @board[first_guess].flip
    @board.render
    second_guess = get_guess
    @board[second_guess].flip
    puts
    @board.render
    if @board[first_guess].value == @board[second_guess].value
      @board[first_guess].matched = true
      @board[second_guess].matched = true
    else
      @board[first_guess].flip
      @board[second_guess].flip
    end
  end

end


if __FILE__ == $0
  puts "what size do you want the board to be?"
  board = gets.chomp.to_i
  Game.new(board).play
end
