class Minesweeper


  def initalize(board_size)
    @board = Board.new(board_size)
    @player = Player.new
  end

  def play_turn

  end

  def run

  end

  def game_over?

  end

  def get_input
    @player.get_input
  end

  def valid_move?(pos)
    @board.valid_move?(pos)
  end

end
