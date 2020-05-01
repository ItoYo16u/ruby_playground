
def uniq_arr(arr)
	arr.reduce({}){|hash,n|
		if hash[n]
			hash
		else
			hash[n] = 1
			hash
		end
	}.keys
end

