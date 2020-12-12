def q_sort(arr)
  if arr.size == 1
    arr
  elsif arr.size == 2
    return arr if arr[0] < arr[1]

    [arr[1], arr[0]]
  else
    # 長さ3以上の数を与えられた場合
    # 適当な値をpivotに決める
    # 今回は配列の左から1,2番目の値の大きいほうを使う
    pivot = arr[0] > arr[1] ? arr[0] : arr[1]
    # pivotの値より大きいものを右に動かす
    left, right = arr.partition { |n| n < pivot }
    q_sort(left) + q_sort(right)
  end
end
