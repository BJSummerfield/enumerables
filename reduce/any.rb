class MyArray < Array
  def any?(&block)
    return true if self == []
    self.reduce([]) do |memo, element|
      if (yield element) == true
        return true
      end
    end
    return false
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
  def includes_8?
    array = MyArray.new(6) {|i| i +1 }
    array.any? { |i| i != 8}
  end

  def modulus_2_equals_zero?
    array = MyArray.new(6) {|i| i +1 }
    array.any? {|i| i % 2 == 0}
  end

  def element_equals_zero?
    array = MyArray.new(6) {|i| i +1 }
    array.any? {|i| i == 0}
  end
end

MyArrayTest.new.run

