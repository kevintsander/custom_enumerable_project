module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |item|
      yield(item, index)
      index += 1
    end
  end

  def my_select
    arr = []
    my_each do |item|
      arr.push(item) if yield(item) == true
    end
    arr
  end

  def my_all?
    my_each do |item|
      return false if yield(item) == false
    end
    true
  end

  def my_any?
    my_each do |item|
      return true if yield(item) == true
    end
    false
  end

  def my_none?
    my_each do |item|
      return false if yield(item) == true
    end
    true
  end

  def my_count
    count = 0
    if block_given?
      my_each do |item|
        count += 1 if yield(item) == true
      end
    else
      count = length
    end
    count
  end

  def my_map
    arr = []
    my_each do |item|
      arr.push(yield(item))
    end
    arr
  end

  def my_inject(initial_value = nil)
    value = initial_value
    my_each do |item|
      value = yield(value, item)
    end
    value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    while (index ||= 0) < length
      yield(self[index])
      index += 1
    end
    self
  end
end
