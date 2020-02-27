class MyArray < Array
  def max(given_element = nil)
    self.sort_by!{|i| i}
    return self.last if given_element == nil
    array = Array.new
    given_element.times do
      array << self.pop
    end
    return array
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
  def max_1_10
    array = MyArray.new(10) {|i| i +1 }
    array.max(4) == [10,9,8,7]
  end

  def max_no_given
    array = MyArray.new(6) {|i| i +1 }
    array.max == 6
  end

  def max_mixed
    array = MyArray.new([54,62,43,23,100,4])
    array.max(3) == [100,62,54]
  end
end

MyArrayTest.new.run