def bubble_sort(arr)
  arr.size.times do |i|
    (arr.size - (i + 1)).times do |j|
      if arr[j] > arr[j + 1]
        arr[j], arr[j + 1] = arr[j + 1], arr[j]
      end
    end
  end
  arr
end
