class Card
  attr_accessor :value, :suit, :matched
  attr_reader :face_up


  def initialize(value)
    @face_up = false
    @value = value
    @suit = nil
    @matched = false
  end

  def flip
    @face_up = !@face_up unless @matched
  end

  

  def ==(other_card)
    self.value == other_card.value && self.suit == other_card.suit
  end



end
