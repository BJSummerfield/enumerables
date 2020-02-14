class MyArray < Array
  def reduce(given_element = nil, &block)
    memo = given_element
    self.each do |element|
      memo = yield(memo, element)
    end
    return memo
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
  def letters_to_upcase
    array = MyArray.new(6) {|i| i +1 }
    array = MyArray.new(array)
    array.reduce(1) {|memo, element| memo = memo * element} == 720
  end

  def numbers_squared
    array = MyArray.new(6) {|i| i +1 }
    array.reduce([]) {|memo, element| memo << element**2} == [1, 4, 9, 16, 25, 36]
  end

  def nil_value
    array = MyArray.new(6) {|i| i +1 }
    array.reduce() {|memo, element| } == nil
  end
end

MyArrayTest.new.run

