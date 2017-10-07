class PolyTreeNode

  attr_reader :value, :parent
  attr_accessor :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node = nil)
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    @parent.children << self unless @parent.nil? || @parent.children.include?(self)
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    raise "Node is not a child" if !self.children.include?(child_node)
    # child_node.parent.children.delete(self)
    child_node.parent=(nil)
  end

  def dfs(target_value)

    return self if self.value == target_value
    children.each do |child|
      target = child.dfs(target_value)
      return target unless target.nil?
    end
    nil
  end

  def bfs(target_value)
    arr = [self]
    until arr.empty?
      target = arr.shift
      # target = arr.pop
      return target if target.value == target_value
      arr.concat(target.children)
      # arr = arr.unshift(target.children).flatten
    end
    nil
  end

end
