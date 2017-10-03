class Player
  attr_reader :name
  attr_accessor :losses

  def initialize(name)
    @name = name
    @losses = 0
  end

  def show_score
    "GHOST"[0...@losses]
  end

  def get_letter(_fragment)
    puts "It is #{@name}'s turn"
    puts "Enter a letter"
    gets.chomp.downcase
  end
end

class ComputerPlayer < Player
  def initialize(name)
    @name = name
    @losses = 0
    @dictionary = {}
    File.open("./dictionary.txt", "r").each do |line|
      @dictionary[line.chomp] = true
    end
  end

  def find_possible_words(fragment)
    possible_words = @dictionary.select do |entry, _value|
      entry[0, word.length] == fragment
    end
    possible_words
  end

  def get_letter(fragment)
    alphabet = ('a'..'z').to_a

    possible_words = find_possible_words(fragment)
    if possible_words.all? {|word| word.length == fragment.length+1}
      possible_words.sample[-1]
    else
      

  end
end
