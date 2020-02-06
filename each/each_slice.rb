class MyArray < Array
  def each_slice(given_element = nil, arr = [], &block)
    if self.length <= given_element
      return (yield self)
    else
      until self == []
        temp = []
        given_element.times do
          if self != []
            temp << self.shift
          end
        end
        if block_given?
          (yield temp)
        end
        arr << temp
      end
    return arr
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
  def slice_3
    array = MyArray.new(6) {|i| i +1 }
    array.each_slice(3) == [[1,2,3,],[4,5,6,]]
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
