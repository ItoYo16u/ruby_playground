# 1000円を払って商品を買ったときのおつりを計算する
# おつりは500, 100, 50, 10円

def calcChange(paid_money,item_name)
	items = {tea: 120, cola: 150, energy_drink: 210}
	changes = {500=> 0, 100=> 0,50=> 0,10 => 0}
	money_to_return = paid_money - items[item_name]
	changes.each do |k,v|
		changes[k] += money_to_return/k
		money_to_return %= k
	end
	changes
end
