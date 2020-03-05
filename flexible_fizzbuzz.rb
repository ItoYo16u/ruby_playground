# input=  15:a 11:r 23:b 41:c m
# mが15で割れるならa 23で割れるならb,...
# mが15で割れるかつ11で割れるなら, 入力値の大きい順に文字列を結合して返す
# つまり raを返す
# どの数でも割れないならmを返す

input_as_array = input.split(/[\s|:]/)
m = input_as_array.pop.to_i #末尾を取り出して数値にキャスト
dividers = input_as_array.each_slice(2).map(&:first).map(&:to_i) # 15,11,23,41
signals = input_as_array.each_slice(2).map(&:last).map # a,r,b,c

pairs = dividers.zip(signals).sort{|l,r| l[0] <=> r[0]}# [11,r][15,a][23,b],[41,c]

result = ""
pairs.each do |pair|
	if m%pair[0]== 0
		result += pair[1]
	end
end

if result==""
	print(m)
else
	print(result)
end

