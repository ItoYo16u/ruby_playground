# すべての桁が素数でできたn桁の整数を生成する再帰関数
# 計算量がO^2になってるのはイケてない気がする
def generate_n_digit_super_prime(n)
	if n == 1
		return [[2],[3],[5],[7]]
	else
		res = []
		cand=[2,3,5,7]
		generate_n_digit_super_prime(n-1).each do |arr|
			cand.each do |c|
				joined = (arr + [c])
				res << joined
			end
		end
		return res
	end
end
# 15桁の素数など、非常に大きいものは分割したものを結合してつくる
# その過程で計算量を減らすため3の倍数であるものや素数で割れるものをすべて取り除いている

def concat_combination(arr_of_arr1,arr_of_arr2)
	dividers = Prime.each(100000).to_a
	result =[]
	arr_of_arr1.each do |a1|
		arr_of_arr2.each do |a2|
			joined=(a1+a2)
			if joined.sum%3 == 0
				break
			end
			is_break=false
			joined_as_int = joined.join("").to_i

			dividers.each do |n|
				if (joined_as_int % n == 0)
					is_break =true
					break
				else
					is_break=false
				end
			end
			if is_break
				break
			end

			result << joined
		end
	end
	return result
end


# 桁が大きい場合、eachをつかうより見つかるまで探して見つかったら終わるほうが効率がいい
# eachは全部終わらないと終わらない(breakを使わない限り)
def find_n_prime(arr,n)
	counter = 0
	idx = 0
	result=[]
	while counter < n
		if Prime.prime?(arr[idx])
			result << arr[idx]
			counter +=1
		end
		idx +=1
	end
	result

end
	
