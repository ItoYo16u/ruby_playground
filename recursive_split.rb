def recursive_split(n)
  s_arr = n.to_s.split("")
  sum = s_arr.reduce(0) { |acc, s| acc += s.to_i }
  if sum > 10
    recursive_split(sum)
  else
    n + sum
  end
end

puts recursive_split(98)
