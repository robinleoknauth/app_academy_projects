require 'poker'
require 'card'
require 'hand'
require 'player'
require 'deck'

RSpec.describe "Deck" do
  subject(:deck) { Deck.new }

  describe "#intialize" do

    it "it initializes with a cards variable as an array" do
      expect(deck.cards).to be_an(Array)
    end

    it "initializes folded cards instance variable with an empty array" do
      expect(deck.folded_cards).to be_an(Array)
    end

    it "calls shuffle" do
      expect(Deck).to receive(:shuffle)
      Deck.new
    end

    it "calls populate" do
      expect(Deck).to receive(:populate)
      Deck.new
    end

  end


  describe "#populate" do

    it "populates the deck with 52 cards" do
      expect(deck.cards.count).to eq(52)
    end

    it "creates cards that are unique" do
      expect(deck.cards.uniq).to eq(deck.cards)
    end

  end



  describe "#shuffle" do

    it "shuffles deck" do
      unshuffled = deck.cards
      deck.shuffle
      shuffled = deck.cards
      expect(unshuffled).to_not eq(shuffled)
    end

  end



  describe "#send" do
    subject(:hand) { Hand.new }

    it "cards count decreases" do
      init_count = deck.cards.count
      deck.send(hand)
      send_count = deck.cards.count
      expect(init_count).to_not eq(send_count)
    end

    it "receiver cards increases" do
      init_count = hand.cards.count
      deck.send(hand)
      send_count = hand.cards.count
      expect(init_count).to_not eq(send_count)
    end

  end


  describe "#receive" do

    it "receives an array of cards" do
      inc_cards = [1, 2, 3]
      init_count = deck.folded_cards.count
      deck.receive(inc_cards)
      final_count = deck.folded_cards.count
      expect(final_count).to eq(init_count + inc_cards.count)
    end

  end




end
