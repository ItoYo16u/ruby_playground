5.times { |n|
  puts n
}
# 0
# 1
# 2
# 3
# 4
#  => 5
-5.times { |n|
  puts n
}
#=> -5

0.times { |n|
  puts n
}
#=> 0

1.5.times { |n|
  puts n
}
#=> NoMethodError: undefined method times for 1.5 float
