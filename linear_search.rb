def linear_search(array, target)
  array.each.with_index do |val, idx|
    if val == target
      return "found #{target} at #{idx}"
    end
  end
end
