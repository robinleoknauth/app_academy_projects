require_relative 'poker'

class Card
  NAMES = [
    "2", "3", "4", "5", "6", "7", "8", "9", "10",
    "Jack", "Queen", "King", "Ace"
  ]

  attr_reader :value, :suit, :name

  def initialize(value, suit)
    @value = value
    @suit = suit
    @name = NAMES[value]
  end

end
