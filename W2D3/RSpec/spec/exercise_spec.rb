require "rspec"
require "exercise"

RSpec.describe "Arrays" do
  describe "#uniq" do
    subject(:arr) { [1,2,6,1,3,3] }

    it "returns the unique elements " do
      expect(arr.sort.uniq).to eq([1,2,3,6])
    end

    it "returns the unique elements in the order they appeared" do
      expect(arr.uniq).to eq([1,2,6,3])
    end
  end

  describe "#two_sum" do
    subject(:arr) { [-1, 0, 2, -2, 1] }

    it "includes all pairs of indicies that add to 0" do
      expect(arr.two_sum).to include([0, 4])
      expect(arr.two_sum).to include([2, 3])
    end

    it "pairs are in order" do
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#transpose" do
    subject(:matrix) do
      [[0, 1, 2],
       [3, 4, 5],
       [6, 7, 8]]
    end
    it "transposes a square matrix correctly" do
      expect(matrix.transpose).to eq([
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
        ])
    end
  end
end


RSpec.describe "StockPicker " do

  describe "#find_most_profitable_days" do
    subject(:prices) do [
      230, 54, 12, 7, 23, 82, 123, 15
    ]
    end

    it "returns an array" do
      expect(prices.find_most_profitable_days).to be_an(Array)
    end

    it "returns an array of length 2" do
      expect(prices.find_most_profitable_days.length).to eq(2)
    end

    it "finds the most profitable pair" do
      expect(prices.find_most_profitable_days).to eq([3, 6])
    end

    it "buy date comes before sell date" do
      buy_date = prices.find_most_profitable_days[0]
      sell_date = prices.find_most_profitable_days[1]
      expect(buy_date < sell_date).to be_truthy
    end

  end

end



RSpec.describe "TowersOfHanoi" do

  describe "#initialize" do
    let(:game) { double("game1", towers: [[3, 2, 1], [], []]) }
    # subject(:game) { TowersOfHanoi.new }

    it "initializes with three arrays" do
      expect(game.towers.all? { |tower| tower.class == Array }).to be_truthy
    end

    it "first tower is of length 3" do
      expect(game.towers[0].length).to eq(3)
    end

    it "first tower is 3, 2, 1" do
      expect(game.towers[0]).to eq([3, 2, 1])
    end

    it "second and third tower are empty" do
      expect(game.towers[1]).to be_empty
      expect(game.towers[2]).to be_empty
    end
  end

  describe "#move" do
    # let(:game) { double("game1", towers: [[3, 2, 1], [], []]) }
    subject(:game) { TowersOfHanoi.new }

    it "moves disk" do
      game.move([0, 1])
      expect(game.towers).to eq([[3, 2], [1], []])
    end

    it "moves disk to valid position" do
    end

  end

  describe "#won?" do

    it "all disks are in one tower that isn't the first tower"

    it "disks are in descending order"

  end

end
