class MyArray < Array
  def find(&block)
    self.reduce([]) do |memo, element|
      return element if (yield element)
      memo
    end
    return nil
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
  def find_6
    array = MyArray.new(6) {|i| i +1 }
    array.find {|i| i == 6} == 6
  end

  def find_modulus_8
    array = MyArray.new(6) {|i| i +1 }
    array.find {|i| i % 8 == 0} == nil
  end

  def slice_2
    array = MyArray.new(6) {|i| i +1 }
    array.find {|i| i == "cat"} == nil
  end
end

MyArrayTest.new.run
