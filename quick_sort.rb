class Array
	
	def quick_sort

		return self if self.length < 2

		pivot = self.shift

		smallers = []
		biggers = []

		self.each do |n|
			if n < pivot
				smallers << n
			else
				biggers << n
			end
		end
		smallers.quick_sort + [pivot] + biggers.quick_sort
	end
end


