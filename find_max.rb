class Array
	def find_max
		tmp_max = self[0]
		self.each do |n|
			if tmp_max < n
				tmp_max = n
			end
		end
	tmp_max
	end
end

p [11].find_max
