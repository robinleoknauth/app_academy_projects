require_relative "Card.rb"
# require "byebug"

class Board

  def initialize(board_size)
    @grid = Array.new(board_size) { Array.new(board_size) }
  end

  def populate
    j = 0
    k = 0
    first_cards_array = (1..13).to_a
    first_cards_array.concat(first_cards_array).sort!
    second_cards_array = first_cards_array.dup

    @grid.each_with_index do |array, i|
      array.each_with_index do |card, i2|
        if j < first_cards_array.length
          @grid[i][i2] = Card.new(first_cards_array[j])
          j+=1
        else
          @grid[i][i2] = Card.new(second_cards_array[k])
          k+=1
        end
      end
    end
  end

  def shuffle_board
    i = @grid.length
    temp_board = []
    @grid.flatten!
    @grid.shuffle!

    @grid.each_slice(i) do |el|
      # byebug
      temp_board << el
    end

    @grid = temp_board
  end

  def render
    @grid.each_with_index do |row, i|
      row.each_with_index do |card, j|
        if @grid[i][j].face_up || @grid[i][j].matched
          print " |#{card.value}| "
        else
          print " |X| "
        end
      end
      puts
    end
  end

  def reveal(pos)
    x, y = pos
    @grid[x][y].flip
  end

  def won?
    @grid.flatten.all?(&:matched)
  end

  def [](pos)
    x, y = pos
    @grid[x][y]

    # x = pos.first
    # y = pos.last
    # @grip[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value

    # x = pos.first
    # y = pos.last
    # @grip[x][y] = value
  end
end

# if __FILE__ == $0
  b = Board.new(5)
  b.populate
  b.shuffle_board
# end
