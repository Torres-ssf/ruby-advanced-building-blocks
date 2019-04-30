
def bubble_sort(array)
  finish_sorted = false
  until finish_sorted
    finish_sorted = true
    for i in 0...array.length - 1
      next if(array[i] <= array[i + 1])
      array[i], array[i + 1] = array[i + 1], array[i]
      finish_sorted = false
    end
  end
  array
end

def bubble_sort_by(array)
  return bubble_sort(array) unless(block_given?)
  finish_sorted = false
  until finish_sorted
    finish_sorted = true
    for i in 0...array.length - 1
      next unless yield(array[i], array[i + 1]) > 0
      array[i], array[i + 1] = array[i + 1], array[i]
      finish_sorted = false
    end
  end
  array
end
