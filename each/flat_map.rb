class MyArray < Array
  def flat_map(&block)
    array = Array.new
    self.each do |element|
      array << (yield element)
    end
    return array.flatten
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
  def flat_map_add_array
    array = MyArray.new
    array = [[1,2],[3,4]]
    array.flat_map {|i| i + [100]} == [1,2,100,3,4,100]
  end

  def flat_map_neg
    array = MyArray.new(4) {|i| i +1 }
    array.flat_map {|i| [i,-i]} == [1, -1, 2, -2, 3, -3, 4, -4]
  end

  def flat_map_nested
    array = MyArray.new(3){|i| i = Array.new(2){|j| j = Array((j+1)..(j+2))}}
    array.flat_map {|i| i + [20] } == [1, 2, 2, 3, 20, 1, 2, 2, 3, 20, 1, 2, 2, 3, 20]
  end
end

MyArrayTest.new.run