class MyArray < Array
  def all(&block)
    self.each do |element|
      return false if (yield element) == false
    end
  return true
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
  def does_not_equal_8
    array = MyArray.new(6) {|i| i +1 }
    array.all { |i| i != 8}
  end

  def equals_2
    array = MyArray.new(6) {|i| i +1 }
    array.all {|i| i == 2} == false
  end

  def equals_nil
    array = MyArray.new(6,nil)
    array.all {|i| i == nil}
  end
end

MyArrayTest.new.run
