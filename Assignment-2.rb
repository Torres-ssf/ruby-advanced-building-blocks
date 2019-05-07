
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

  def my_all?(arg = nil)
    if block_given?
      self.my_each { |element| return false unless(yield(element)) }
    elsif arg.class == Class
      self.my_each { |element| return false unless element.class == arg }
    elsif arg.class == Regexp
      self.my_each { |element| return false if (element =~ arg).nil? }
    elsif arg.nil?
      self.my_each { |element| return false unless(element) }
    end
    true
  end

  def my_any?(arg = nil)
    if block_given?
      self.my_each { |element| return true if yield(element) }
    elsif arg.class == Class
      self.my_each { |element| return true if element.class == arg }
    elsif arg.class == Regexp
      self.my_each { |element| return true unless (element =~ arg).nil? }
    elsif arg.nil?
      self.my_each { |element| return true if element }
    end
    false
  end

  def my_none?(arg = nil)
    if block_given?
      self.my_each { |element| return false if yield(element) }
    elsif arg.class == Class
      self.my_each { |element| return false if element.class == arg }
    elsif arg.class == Regexp
      self.my_each { |element| return false unless (element =~ arg).nil? }
    elsif arg.nil?
      self.my_each { |element| return false if element }
    end
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
    x = self[0]
    self[1..-1].my_each { |element| x = yield(x, element) }
    x
  end

  def multiply_els
    return self.my_inject {|inject, num| inject * num }
  end
end
