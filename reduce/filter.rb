class MyArray < Array
  def filter(&block)
    self.reduce([]) do |memo, element|
      if (yield element)
        memo << element
      end
      memo
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
  def filter_even
    array = MyArray.new(6) {|i| i +1 }
    array.filter {|i| i.even?} == [2,4,6]
  end

  def filter_odd
    array = MyArray.new(6) {|i| i +1 }
    array.filter {|i| i.odd?} == [1,3,5]
  end

  def filter_vowels
    array = MyArray.new(%w[ a b c d e f ])
    array.filter {|i| i =~ /[aeiou]/} == ['a','e']
  end
end

MyArrayTest.new.run