# def max_window_range(arr, w)
#   max_range = 0
#   i=0
#   while i+w-1 < arr.length
#
#   end
# end


class MyStack

  attr_reader :max_value

  def initialize
    @stack = []
    @max_value = nil
    @min_value = nil
  end

  def push(el)
    @stack << [el, @max_val, @min_value]
    if @max_value.nil? || el[0] > @max_value
      @max_value = el[0]
    end
    if @min_value.nil? || el[0] < @min_value
      @min_value = el[0]
    end
  end

  def pop
    el = @stack.pop
    @max_value = el[1]
    @min_value = el[2]
    el
  end

  def peek
    @stack.last.dup
  end

  def empty?
    @stack.empty?
  end

  def size
    @stack.length
  end
end

class MyQueue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.unshift
  end

  def peek
    @queue.first.dup
  end

  def empty?
    @queue.empty?
  end

  def size
    @queue.length
  end
end

class StackQueue

  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
    @meta_queue = MyQueue.new

  end


  def enqueue(el)
    @stack1.push(el)
  end

  def dequeue
    if size.zero?
      raise "You Fool!"
    end
    until @stack1.empty?
      el = @stack1.pop
      @stack2.push(el)
      @meta_queue.enqueue([el[1], el[2]])
    end
    @stack2.pop
    #[@stack2.pop, @meta_queue.dequeue]
    @meta_queue.dequeue
  end

  # def peek
  #   @queue.first.dup
  # end
  #
  # def empty?
  #   @queue.empty?
  # end

  def size
    @stack1.size + @stack2.size
  end

end



def windowed_max_range(arr, w)
  stackie = StackQueue.new

  arr[0..w-1].each do |el|
    stackie.enqueue(el)
  end

  maxrange = 0

  arr[1..arr.length-w-1].each_with_index do |el, i|
    
    max,min = stackie.dequeue
    range = max - min
    maxrange = range if range > maxrange
    stackie.enqueue(arr[i+w])
  end
  maxrange
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
