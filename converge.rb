# ソートされた二つの配列を結合してソートされたひとつの配列を作る再帰メソッド

def merge_sort(arr)
	# e.g. [7,2,6,4,3,8,5,1]
	# まず、arrを最小単位まで分割する(再帰)
	# 終端条件
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
		# leftはさらに小さいleftとrightに分割され、さらにそのleftもさらに小さいleftとrightに分割される(len=1or2になるまで)
		
		left= merge_sort(arr[0..arr.size/2-1])
		# 分割してわたす、長さ1 or 2ならソートした配列が返ってくる、
		# 最初に帰ってくるのは[2,7]
		
		right= merge_sort(arr[arr.size/2..-1])
		# 最初に帰ってくるのは [4,6]
		# arr = arr/2, arr= arr/2/2... になっている
		#
		# 半分に割って分割がまず行われる, 終端条件優先
		# inputが[2,7,6,4,3,8,5,1,8]のとき、最初に帰ってくるleftは[2,7],rightは[4,6],次に返ってくるleft=[3,8], 次にleft=[5],right=[1,8]が返ってくる
		# 長さ3以上の場合のみ、つまり分割してようそ2つに結合した後に関しての処理
		
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

	

	

