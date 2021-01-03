e = "2.7182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274274663919320030599218174135966290435729003342952605956307381323286279434907632338298807531952510190"

def rm_dot(str)
  str.delete(".")
end
def list_10_digit_nums(str,tmp_str_arr)
  top_10_digits = str.slice(0,10)
  if(top_10_digits.length < 10)
    return tmp_str_arr
  end
  last_digit = top_10_digits.split("").last.to_i
  if(last_digit % 2 == 0 || last_digit % 5 == 0 || top_10_digits.split("").map(&:to_i).sum % 11 == 0 )
    str.slice!(0,1)
    return list_10_digit_nums(str,tmp_str_arr)
  end
  tmp_str_arr << top_10_digits.to_i
  str.slice!(0,1)
  list_10_digit_nums(str,tmp_str_arr)
end

def is_prime(num)
  [*2..Math::sqrt(num).to_i+1].each do |i|
    return false if num%i == 0
  end
  return true
end
e_without_dot = rm_dot(e)
puts list_10_digit_nums(e_without_dot,[]).each{|n|
  if(is_prime(n))
    puts "#{n}"
    break;
  end
}
