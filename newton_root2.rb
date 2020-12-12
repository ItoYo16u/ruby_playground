x = 5.0
eps = 0.0001

while true
  x2 = x - (x ** 2 - 2) / (x * 2)
  if (x2 - x).abs < eps
    break
  end
  x = x2
end
puts x
