test_array = [8, 5, 8, 2, 9, 34, 1, 7, 987, 32, 1, 6, 99, 10]

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

  def my_selection
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

end
