class MyArray < Array
  def eacha(&block)
    self.reduce([]) do |memo, element|
      (yield element)
    end
    return self
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
  def slice_3
    array = MyArray.new(6) {|i| i +1 }
    array.eacha {|i| i % 3 == 0} == array
  end

  def slice_5
    array = MyArray.new(6) {|i| i +1 }
    array.eacha {|i| i = "cow"} == array
  end

  def slice_2
    array = MyArray.new(6) {|i| i +1 }
    array.eacha {|i| puts "Test Statment"} == array
  end
end

MyArrayTest.new.run


