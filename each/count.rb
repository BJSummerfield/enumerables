class MyArray < Array
  def count(given_element = nil, count = 0, &block)
    self.each do |element|
      if given_element
        element == given_element ? count += 1 : count
      elsif block_given?
        yield(element) ? count +=1 : count
      else
        count += 1
      end
    end
  return count
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
