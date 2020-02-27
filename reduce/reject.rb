class MyArray < Array
  def reject(&block)
    self.reduce([]) do |memo, element|
      if (yield element) == false
        memo << element
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
  def reject_divide_3
    array = MyArray.new(10) {|i| i +1 }
    array.reject {|i| i % 3 == 0} == [1,2,4,5,7,8,10]
  end

  def reject_even
    array = MyArray.new(5) {|i| i +1 }
    array.reject {|i| i.even?} == [1,3,5]
  end

  def reject_mix
    array = MyArray.new([54,62,43,23,100,4])
    array.reject{|i| i == 100} == [54,62,43,23,4]
  end
end

MyArrayTest.new.run