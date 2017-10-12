require 'poker'
require 'card'
require 'hand'
require 'player'
require 'deck'

RSpec.describe "Poker" do
  subject(:game) { Poker.new }

  describe "#initialize" do

    it "initializes with a deck as a deck object" do
      expect(game.deck).to be_a(Deck)
    end

    it "initializes with a common pot of 0" do
      expect(game.common_pot).to eq(0)
    end

    it "initializes with an array of players with player objects" do
      expect(game.players.all? { |el| el.class == Player } ).to be_truthy
    end

    it "initializes with a game_over variable with false" do
      expect(game.game_over).to be_falsey
    end

  end

  describe "#play" do

    it "calls play_turn until game over" do
      expect(game).to receive(:play_turn)
    end

  end

  describe "#play_turn" do

  end

  describe "#game_over?" do

  end

  describe "#dist_comm_pot" do

  end

end
