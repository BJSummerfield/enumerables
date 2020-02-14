class MyArray < Array
  def each_with_object(given_element = nil, &block)
    memo = given_element
    self.each do |element|
      yield(memo, element)
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
    array = Array('a'..'c')
    array = MyArray.new(array)
    array.each_with_object({}) {|memo, element| memo[element] = element.upcase} == {"a"=>"A", "b"=>"B", "c"=>"C"}
  end

  def numbers_squared
    array = MyArray.new(6) {|i| i +1 }
    array.each_with_object([]) {|memo, element| memo << element**2} == [1, 4, 9, 16, 25, 36]
  end

  def nil_value
    array = MyArray.new(6) {|i| i +1 }
    array.each_with_object() {|memo, element| } == nil
  end
end

MyArrayTest.new.run
