class Array
  def quick_sort
    return self if length < 2

    pivot = shift

    smallers = []
    biggers = []

    each do |n|
      if n < pivot
        smallers << n
      else
        biggers << n
      end
    end
    smallers.quick_sort + [pivot] + biggers.quick_sort
  end
end
