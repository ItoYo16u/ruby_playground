def merge_sort(arr)
	# e.g. [7,2,6,4,3,8,5,1]
	# まず、arrを最小単位まで分割
	if arr.size == 1
		return arr
	elsif arr.size == 2
		if arr[0]> arr[1]
			arr[0],arr[1]= arr[1],arr[0]
			return arr
		else
			return arr
		end
	# それ以外
	# 2分割してマージソートする
	else
		# input eg 2,7,6,4,3,8,5,1,8
		left= merge_sort(arr[0..arr.size/2-1]) # 再帰なのでわかりにくいが、merge_sortの定義より、分割・ソート済みの配列が返ってくる
		right= merge_sort(arr[arr.size/2..-1])
		# Array.new(N){do something} はdo somethingのブロックを別々にN回よび、その返り値を配列のそれぞれの値とする。
		lv = left.shift # left の先頭を削除して取得する
		rv = right.shift # rightの先頭を削除して取得する
		# 大きい順に直した配列を用意する、引数に渡したarr を２分割している
		# ソートして元に戻すので長さNはarr.sizeでOK
		Array.new(arr.size){ # arr.sizeにしてるからlv/rv両方がnilになることはない
			# arr.size回ブロックが呼ばれその返り値が配列の各要素になる
			# 各回、lvとrvを比較して、その時のlvの値を返したうえでlv or rvを更新する
			if lv < rv
				lv.tap{ # このブロックの返す値は必ず元(左)のlvの値
					lv = left.shift || right[-1] || rv # lvを更新する
				} # left.shiftもright[-1]もnilになるのは、[n]と[m]のときにlv,rvをとったとき
				# =>  更新前のlvを返す
			else # rv < lv
				rv.tap{ rv = right.shift || left[-1]|| lv}
			end
		}
	end
end

	

	

