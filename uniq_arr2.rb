def uniq_arr(arr)
  arr = arr.sort
  index = 0

  while index < arr.size
    if arr[index] == arr[index + 1]
      arr.delete_at(index + 1)
    else
      index += 1
    end
  end
end
