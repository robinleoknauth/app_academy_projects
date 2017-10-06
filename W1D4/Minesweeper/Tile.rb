class Tile
  attr_accessor :bomb
  attr_reader :revealed, :bomb_neighbors, :neighbors_hash

  def initialize(reveal = false, bomb = false)
    @revealed = reveal
    @bomb = bomb
    @bomb_neighbors = 0

  end

  def reveal
    @revealed = true
  end

  def neighbors(pos, board)
    @neighbors_hash = {}
    adjacent = [[-1,-1], [-1,0], [-1, 1], [0,1], [1,1], [1,0], [1,-1], [0,-1]]
    adjacent.each do |relative_pos|
      if relative_pos[0] + pos[0] < board.grid.length && relative_pos[1] + pos[1] < board.grid.length
        if relative_pos[0] + pos[0] >= 0 && relative_pos[1] + pos[1] >= 0
          x = pos[0] + relative_pos[0]
          y = pos[1] + relative_pos[1]
          @neighbors_hash[relative_pos] = board[x,y].bomb
        end
      end
    end
    @neighbors_hash
  end

  def neighbors_bombs
    @bomb_neighbors = @neighbors_hash.count { |_k,v| v }
  end

  def recursive_reveal(pos, board)
    return false if @bomb_neighbors.values.include?(true)
    self.reveal
    @bomb_neighbors.keys.each do |pos|
      board[pos].neighbors
      board[pos].neighbors_bombs
      recursive_reveal(pos, board)
    end
  end
end
