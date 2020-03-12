def q_s(arr)
	if arr.size==1
		return arr
	elsif arr.size == 2
		return [arr[1],arr[0]] if arr[0]>arr[1]
		return arr
	else
		pivot = if arr[0]>arr[1] then arr[0] else arr[1] end
		left,right = arr.partition{|n| n < pivot}
		q_s(left) + q_s(right)
	end
end

