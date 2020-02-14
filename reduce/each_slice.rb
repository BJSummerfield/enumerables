class MyArray < Array
  def each_slice(given_element, &block)
    i = 0
    j = 0
    a = []
    self.reduce([]) do |memo, element|
      memo << element
      i += 1
      j += 1
      if j == self.length
        a << memo
        return a
      elsif i >= given_element
        a << memo
        memo = []
        i = 0
      end
      memo
    end
    return a
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
    array.each_slice(3) == [[1,2,3,],[4,5,6]]
  end

  def slice_5
    array = MyArray.new(6) {|i| i +1 }
    array.each_slice(5) == [[1,2,3,4,5],[6]]
  end

  def slice_2
    array = MyArray.new(6) {|i| i +1 }
    array.each_slice(2) == [[1,2],[3,4],[5,6]]
  end
end

MyArrayTest.new.run
