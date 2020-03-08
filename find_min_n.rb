# 与えられたn桁の数を並び替えてn桁の最小の数を返す
# 方針
# 与えられた数字を配列にする
# もし最小値が0の場合は,左端に0を置けないので0より大きい最小値をひとつ取得する
# 0より大きい最小値をひとつもとの配列から削除する
# もとの配列をソートする
# 左端と配列を結合して数値に直して返す
# 最小値が0でない場合は、ソートして数字に直して返す
#
def find_min(str)
	arr = str.split("").sort.map(&:to_i)
	if arr[0]== 0
		arr.each.with_index do |val,idx|
			if val > 0
				arr[0],arr[idx]= arr[idx],arr[0]
				break
			end
		end
	end
	print(arr.join.to_i)
end
print(
  find_min("11100000010001000")
)
 print( find_min("3245"))

