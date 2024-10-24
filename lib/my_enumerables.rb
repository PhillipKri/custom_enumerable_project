module Enumerable
  # Your code goes here
  
  def my_each_with_index
    if block_given?
      i = 0
      until i == self.length do
        yield(self[i],i)
        i += 1
      end
    end
    self
  end

  def my_inject(num)
    if block_given?
      temp = num
      self.my_each do |e|
        temp = yield(temp, e)
      end
      temp
    end
  end

  def my_select
    if block_given?
      temp = Array.new
      self.my_each do |e|
        temp << e if yield(e)
      end 
    end
    temp
  end
  
  def my_map
    if block_given?
      i = Array.new
      self.my_each do |e|
        i << yield(e)
      end
      i
    end
  end

  def my_none?
    if block_given?
      self.my_each do |e|
        if yield(e) == true
          return false
        end
      end
      return true
    end
  end

  def my_all?
    if block_given?
      self.my_each do |e|
        if yield(e) == false
          return false
        end
      end
      return true
    end
  end

  def my_any?
    if block_given?
      self.my_each do |e|
        if yield(e)
          return true
        end
      end
      return false
    end
  end

  def my_count
    if block_given?
      count = 0
      self.my_each do |e|
        if yield(e)
          count += 1
        end
      end
      count
    else
      self.length
    end
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    until i == self.length do
      yield(self[i])
      i += 1
    end
    self
  end
end
