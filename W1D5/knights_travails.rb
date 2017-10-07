require_relative '00_tree_node.rb'

class KnightPathFinder

  attr_reader :visited_positions

  def initialize(starting_pos = [0,0])
    @starting_pos = starting_pos
    @valid_moves = []
    @visited_positions = [starting_pos]
  end


  def build_move_tree
  end

  def self.valid_moves(pos)
    
  end

  def new_move_positions(pos)
  end

end
