
def my_min_1(arr)
  min = arr[0]
  arr[0..-1].each do |el1|
    arr[0..-1].each do |el2|
      min = el1 if el1  < el2 && el1 < mins
    end
  end
  min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#p my_min_1(list)

def my_min_2(arr)
  min = arr[0]
  arr.each do |el|
    min = el if el<min
  end
  min
end
#p my_min_2(list)

def largest_contiguous_subsum(arr)
  first = 0
  last = 0
  max = arr[0]
  i=0
  while i <arr.length
    j = i+1
    while j < arr.length
      sum = arr[i..j].reduce(:+)
      if sum > max
        first = i
        last = j
        max = sum
      end
      j+=1
    end
    i+=1
  end
  arr[first..last]
end
list = [5, 3, -7]
#p largest_contiguous_subsum(list)

# arr.each_index do |i|
#    arr[i + 1..-1]


=begin

# realized this is not what was asked of us
def sub_arrays(arr)
  subarr = []
  arr.each_index do |i|
    arr.each_index do |j|
      subarr << arr[i..j].reduce(:+) unless j < i
    end
  end

  subarr
end

=end

#list = [1, 2, 3, 4, 5, 6]
#p sub_arrays(list)

def better_subs(arr)
  head = 0
  tail = 0
  max = arr[0]
  potential_max = 0
  arr.each_index do |i|
    potential_max += arr[i]
    if potential_max > max
      max = potential_max
      head = i
    end
  end
  # p max
  potential_max = max
  arr.each_index do |i|
    break if i > head
    potential_max -= arr[i]
    if potential_max > max
      max = potential_max
      tail = i
    end
  end
  p arr[tail + 1..head]
  max
end

list = [8, 2, 3, -6, 7, -6, 7, 50, 60, -100, 50, 60, 40]
list2 = [-8, -2, -3, -6, -7, -6, -7, -50, -60, -100, -50, -60, -40]
# p better_subs(list)


# solution from aA which only needs one iteration
def largest_contiguous_subsum2(arr)
  largest = arr.first 
  current = arr.first

  # commented this out because it seems utterly unnecessary, yes, same big O
  # return arr.max if arr.all? { |num| num < 0 }

  arr.drop(1).each do |num|
    current = 0 if current < 0
    current += num
    largest = current if current > largest
  end

  largest
end

p largest_contiguous_subsum2(list2)
