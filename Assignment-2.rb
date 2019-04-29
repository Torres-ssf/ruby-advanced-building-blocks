
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
    new_array = []
    self.my_each { |element| new_array << (yield(element)) }
    new_array
  end

  def my_inject
    new_array, x = [], 0
    self.my_each { |element| new_array << (x = yield(x, element)) }
    new_array
  end

end
