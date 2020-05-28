def f(x)
  if x <= 1
    return 0
  elsif x %2 == 0
    return f(x+1) + x
  else
    return f(x-3) -x
  end
end