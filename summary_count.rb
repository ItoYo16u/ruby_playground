data = ["banana","tomato","apple","banana","apple","orange","orange","pine","tomato"]

puts data.inject(Hash.new(0)) {|h,d| h[d] += 1; h}

class Food
	def initialize(name)
		@name = name
	end
	def is_edible
		true
	end
end

class Fruit < Food
  attr_reader :name
  def initialize(name)
	 super
  end 
  def type
	  :fruit
  end
end

class Vegetable < Food
	def type
		:vegetable
	end
end

apple = Fruit.new("apple")
puts apple.type
puts apple.name
