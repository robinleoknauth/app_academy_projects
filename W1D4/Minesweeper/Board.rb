class Board
  attr_reader :grid

  def initalize(board_size = 9, num_bombs = 10)
    @grid = Array.new(board_size) { Array.new(board_size) { Tile.new } }
    @num_bombs = num_bombs
  end

  def populate
    @num_bombs.times do
      x = rand(0...@grid.size)
      y = rand(0...@grid.size)
      @grid[x,y].bomb == true ? redo : @grid[x,y].bomb = true
    end
  end

  def render
    @grid.each do |row|
      row.each do |tile|

        print "#{tile.}"
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end
end
