def merge_sort(arr)
  if arr.size == 1
    return arr
  elsif arr.size == 2
    if arr[0] > arr[1]
      arr[0], arr[1] = arr[1], arr[0]
      return arr
    else
      return arr
    end
  else
    left = merge_sort(arr[0..arr.size / 2 - 1])
    right = merge_sort(arr[arr.size / 2..-1])

    lv = left.shift
    rv = right.shift

    Array.new(arr.size) {
      if lv < rv
        lv.tap {
          lv = left.shift || right[-1] || rv # lvを更新する 毎ブロックで比較するのでnilを入れたくない
        }
      else # rv < lv
        rv.tap { rv = right.shift || left[-1] || lv }
      end
    }
  end
end
