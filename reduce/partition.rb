class MyArray < Array
  def partition(&block)
    self.reduce(Array.new(2) {|i| i = Array.new}) do |memo, element|
      if (yield element) == false
        memo[1] << element
      else 
        memo[0] << element
      end
      memo
    end
  end
end

class BaseTest
  def run
    ((methods - Object.methods) - [:run]).each do |method|
      p "#{method} #{self.send(method) ? 'passed' : 'failed'}"
    end
  end
end

class MyArrayTest < BaseTest
  def partition_even
    array = MyArray.new(10) {|i| i +1 }
    array.partition {|i| i % 3 == 0} == [[3, 6, 9], [1, 2, 4, 5, 7, 8, 10]]
  end

  def partition_divide_3
    array = MyArray.new(10) {|i| i +1 }
    array.partition {|i| i.even?} == [[2, 4, 6, 8, 10], [1, 3, 5, 7, 9]]
  end

  def partition_
    array = MyArray.new([54,62,43,23,100,4])
    array.partition{|i| i == 100} == [[100], [54, 62, 43, 23, 4]]
  end
end

MyArrayTest.new.run

