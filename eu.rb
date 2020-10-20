def gcd(a,b)
	if a%b == 0
		return b
	else
		gcd(b,a%b)
	end
end

puts gcd(69,18)
