def select_sort(array)
	ary = array.dup
	ary.each.with_index do |val,idx|
		min_num = val
		min_pos = idx
		((idx+1)...ary.length).each do |iy|
			if min_num > ary[iy]
				min_num = ary[iy]
				min_pos = iy
			end
		end	
		ary[idx],ary[min_pos] = min_num,ary[ix]
	end
	ary
end	
