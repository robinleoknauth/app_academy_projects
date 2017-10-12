class Array
  def two_sum
    result = []
    self.each_index do |i|
      j = i + 1
      while j < self.length
        result << [i, j] if self[i] + self[j] == 0
        j += 1
      end
    end
    result
  end


  def find_most_profitable_days
    buy_date = 0
    sell_date = length - 1
    self.each_with_index do |price, day|
      if price < self[buy_date]
        buy_date = day if day < sell_date
      end
      if price > self[sell_date]
        sell_date = day if day > buy_date
      end
    end
    [buy_date, sell_date]
  end


end



class TowersOfHanoi
  attr_accessor :towers
  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def get_move
    gets.chomp.split(",")
  end

  def move(input)
    from = input[0]
    to = input[1]
    if @towers[to].empty? || @towers[from].last < @towers[to].last
      disk = @towers[from].pop
      @towers[to].push(disk)
    end
  end
end
