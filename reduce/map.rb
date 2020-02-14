class MyArray < Array
  def map(&block)
    return self.reduce([]) do |memo, element|
      memo << (yield element)
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
  def num_plus_1
    array = MyArray.new(6) {|i| i +1 }
    array.map { |n| n + 1 } == [2,3,4,5,6,7]
  end

  def num_squared
    array = MyArray.new(6) {|i| i +1 }
    array.map { |n| n ** 2 } == [1,4,9,16,25,36]
  end

  def map_maps
    array = MyArray.new(6) {|i| i +1 }
    array.map { |n| n = "Map" } == Array.new(6,"Map")
  end
end

MyArrayTest.new.run
