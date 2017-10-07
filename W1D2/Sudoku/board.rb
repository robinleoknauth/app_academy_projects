
# require 'byebug'
class Board



  def initialize
    @grid = []
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def get_file
    File.readlines("sudoku3.txt").map(&:chomp)
  end

  def build_grid
    file_array = get_file
    arr = []
    file_array.each do |string|
      sub_arr = []
      string.chars.each do |character|
        if character == "0"
          sub_arr << Tile.new(character.to_i, false)
        else
          sub_arr << Tile.new(character.to_i, true)
        end
      end
      arr << sub_arr
    end
    @grid = arr
  end

  def render
    @grid.each_with_index do |row, i|
      row.each_index do |j|
        # byebug
        if @grid[i][j].given
          print " |#{@grid[i][j].value}| ".colorize(:blue)
        else
          print " |#{@grid[i][j].value}| "
        end
      end
      puts
    end
  end

  def solved?
    columns_solved? && rows_solved? && blocks_solved?
  end

  def single_column_solved?(column)
    check_array = []
    @grid.each_index do |i|
      check_array << @grid[i][column].value
    end

    check_array.sort == (1..9).to_a.sort
  end

  def columns_solved?
    (0..8).all? { |col| single_column_solved?(col) }
  end

  def single_row_solved?(row)
    check_array = []
    @grid.each_index do |i|
      check_array << @grid[row][i].value
    end
    check_array.sort == (1..9).to_a.sort
  end

  def rows_solved?
    (0..8).all? { |row| single_row_solved?(row) }
  end

  def single_block_solved?(x, y)
    check_array = []
    (x..x + 2).each do |i|
      (y..y + 2).each do |j|
        check_array << @grid[i][j].value
      end
    end
    check_array.sort == (1..9).to_a.sort
  end

  def blocks_solved?
    i = 0

    while i < 9
      j = 0
      while j < 9
        return false if !single_block_solved(i, j)
        j += 3
      end
      i += 3
    end
    true
  end




end

# class Fixnum
#
#   def given
#     if self == 0
#       false
#     else
#       true
#     end
#   end
#
#   def value
#     self
#
#   end
# end
