def reverse(list,result=[])
  # reverseはあたえられた配列の先頭とそれ以降を入れ替えた配列を返す関数
	if list.length <= 1
		return result.unshift(list[0])
	else
		first_elm = list.shift
		reverse(list,result.unshift(first_elm))
	end
end
