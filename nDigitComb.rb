def n_digit_comb(digit,n)
	if digit == 1
		(0..(n-1)).map{|i|
			[i]
		}
	else
		results = []
		n_digit_comb(digit-1,n).each do |tmp_result|
			(0..(n-1)).each do |k|
				result = tmp_result << d
				results << result
			end
		end
		results
	end
end

