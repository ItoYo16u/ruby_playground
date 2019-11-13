def binary_search(array, target)
	head = 0
	tail = array.count - 1

	while head <= tail

		center = (head + tail)/2

		if array[center] == target
			return center
		elsif array[center] < target
			head = center + 1
		else # array[center] >= target
			tail = center -1
		end
	end
	
	return "idx is nothing"

end

p binary_search([11,13,17,19,23,29,31],17)

