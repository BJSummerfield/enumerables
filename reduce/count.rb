class MyArray < Array
  def count(given_element = nil, &block)
    self.reduce(0) do |memo, element|
      if given_element
        element == given_element ? memo += 1 : memo
      elsif block_given?
        yield(element) ? memo += 1 : memo
      else
        memo += 1
      end
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
  def count_elements
    array = MyArray.new(6) {|i| i +1 }
    array.count == 6
  end

  def count_number_3
    array = MyArray.new(6) {|i| i +1 }
    array.count(3) == 1
  end

  def modulus_2?
    array = MyArray.new(6) {|i| i +1 }
    array.count {|i| i % 2 == 0} == 3
  end
end

MyArrayTest.new.run
