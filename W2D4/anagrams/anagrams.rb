
def first_anagram?(str1, str2)
  str_1_perms = str1.chars.permutation.to_a
  str_1_perms.include?(str2.chars)
end

#p first_anagram?("elvis", "lives")

def second_anagram?(str1, str2)
  #str1_copy, str2_copy = str1, str2
  strchar1 = str1.chars
  strchar2 = str2.chars

  i = 0
  while i < strchar1.length
    j = 0
    while j < strchar2.length
      if strchar1[i] == strchar2[j]
        strchar1.delete_at(i)
        strchar2.delete_at(j)
        i-=1
        j-=1
      end
      j+=1
    end
    i+=1
  end
  p strchar1
  p strchar2
  strchar1.empty? && strchar2.empty?
end

#p second_anagram?("elvis", "lives")

def third_anagram?(str1,str2)
  str1.chars.sort == str2.chars.sort
end

# p third_anagram?("elvis","lives")

def fourth_anagram?(str1, str2)
  str1_hash = Hash.new(0)
  str2_hash = Hash.new(0)

  str1.chars.each do |el|
    str1_hash[el] += 1
  end
  str2.chars.each do |el|
    str2_hash[el] += 1
  end

  str1_hash == str2_hash

end



def fourth_anagram?(str1, str2)
  str1_hash = Hash.new(0)


  str1.chars.each do |el|
    str1_hash[el] += 1
  end

  str2.chars.each do |el|
    str1_hash[el] -= 1
  end


  str1_hash.none? { |_k, v| v != 0  }

end
p fourth_anagram?("elvis","lives")
