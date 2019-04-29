test_array = [8, 5, 8, 2, 9, 34, 1, 7, 987, 32, 1, 6, 99, 10]
test_array2 = [1, 2, 3, 4]

module Enumerable

  def my_each
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    for i in self
      yield(i, index)
      index += 1
    end
  end

  def my_select
    selection_array = []
    self.my_each { |element| selection_array << element if(yield(element)) }
    selection_array
  end

  def my_all?
    self.my_each { |element| return false unless(yield(element)) }
    true
  end

  def my_any?
    self.my_each { |element| return true if yield(element) }
    false
  end

  def my_none?
    self.my_each { |element| return false if yield(element) }
    true
  end

  def my_count
    count = 0
    if(block_given?)
      self.my_each { |element| count += 1 if(yield(element)) }
    else
      self.my_each { |element| count += 1 }
    end
    count
  end

  def my_map
    self.my_each { |element| yield(element) }
  end

  def my_inject
    self.my_each { |x, element| x = yield(x, element)}
  end

end
