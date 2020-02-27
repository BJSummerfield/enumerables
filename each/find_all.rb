class MyArray < Array
  def find_all(&block)
    array = Array.new
    self.each do |element|
      if (yield element)
        array << element
      end
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
  def filter_even
    array = MyArray.new(6) {|i| i +1 }
    array.find_all {|i| i.even?} == [2,4,6]
  end

  def filter_odd
    array = MyArray.new(6) {|i| i +1 }
    array.find_all {|i| i.odd?} == [1,3,5]
  end

  def filter_vowels
    array = MyArray.new(%w[ a b c d e f ])
    array.find_all {|i| i =~ /[aeiou]/} == ['a','e']
  end
end

MyArrayTest.new.run