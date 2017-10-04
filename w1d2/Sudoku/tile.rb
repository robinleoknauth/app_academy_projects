require "colorize"


class Tile
  attr_accessor :value
  attr_reader :given

  def initialize(value, given)
    @value = value
    @given = given

  end

end
