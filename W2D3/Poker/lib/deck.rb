require_relative 'poker'

class Deck

  attr_accessor :cards, :folded_cards

  def initialize
    @cards = Deck.populate
    @folded_cards = []
    shuffle
  end

  def self.populate
    cards = []
    suits = %w(heart, spade, club, diamond)
    (0..12).each do |val|
      suits.each do |suit|
        cards << Card.new(val, suit)
      end
    end
    cards
  end

  def shuffle
    @cards = (@folded_cards + @cards).shuffle
  end

  def send(receiver)
    receiver.cards << @cards.pop
  end

  def receive(inc_cards)
    inc_cards.each do |card|
      @folded_cards << card
    end
  end

end
