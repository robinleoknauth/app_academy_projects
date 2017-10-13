

def bad_two_sum?(arr, target)
  arr.each_index do |i|
    j = i+1
    while j< arr.length
      return true if arr[i] + arr[j] == target
      j+=1
    end
  end
  false
end

def okay_two_sum?(arr, target)
  arr.sort!
  head = arr.length-1
  tail = 0
  until tail>=head
    return true if arr[head] + arr[tail] == target
    tail += 1
    return false if tail>=head
    return true if arr[head] + arr[tail] == target
    head -= 1
    p "#{tail},#{head}"
  end
  false
end
#
# def mergesort(arr)
#   if arr
# end
#
# def merge(left,right)
# end

def good_two_sum?(arr, target)
  input_hash = Hash.new
  
  arr.each.with_index do |el, i|
    input_hash[el]=i
  end
  arr.each.with_index do |el, i|
    var = input_hash[target - el]
    return true if var && var !=i
  end
  false
end

arr = [0, 1, 5, 7]
p good_two_sum?(arr, 6) # => should be true
p good_two_sum?(arr, 10) # => should be false
