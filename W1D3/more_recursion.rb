def recursive_fibonacci(number)
  return [1] if number == 1
  return [1 ,1] if number == 2
  return nil if number == 0
  fib = recursive_fibonacci(number - 1)
  fib + [recursive_fibonacci(number - 1)[-1] + recursive_fibonacci(number - 1)[-2] ]

end


#Problem 1: You have array of integers. Write a recursive solution to find the
#sum of the integers.

def sum_recur(array)
  return array[0] if array.length == 1
  number = array[0]
  number + sum_recur(array[1..-1])
end

#Problem 2: You have array of integers. Write a recursive solution to determine
#whether or not the array contains a specific value.

def includes?(array, target)
  return array[0] == target if array.length == 1
  return true if array.pop == target
  includes?(array, target)
end


# Problem 3: You have an unsorted array of integers. Write a recursive solution
# to count the number of occurrences of a specific value.

def num_occur(array, target)
  return array.length if array.all? { |el| el == target }
  el = array[0]
  if el == target
    return num_occur((array[1..-1] + [el]), target)
  else
    return num_occur(array[1..-1], target)
  end
end



# Problem 4: You have array of integers. Write a recursive solution to determine
# whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  return array[0] + array[1] == 12 if array.length == 2
  return true if array[0] + array[1] == 12
  add_to_twelve?(array[1..-1])
end


# Problem 5: You have array of integers. Write a recursive solution to determine
# if the array is sorted.

def sorted?(array)
  return true if array.length == 1
  return array[0] < array[1] if array.length == 2
  return false if array[0] > array[1]
  sorted?(array[1..-1])
end



# Problem 6: Write a recursive function to reverse a string. Don't use any
# built-in #reverse methods!

def reverse(string)
  return string if string.length == 1
  reverse(string[1..-1]) + string[0]
end
