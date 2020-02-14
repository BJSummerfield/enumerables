class MyArray < Array
  def each_with_index(&block)
    index = 0
    self.each do |element|
      yield(element, index)
      index += 1
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
  def index_of_6
    array = MyArray.new(6) {|i| i + 1 }
    array.each_with_index {|v,i| return i  if v == 6} == 5
  end

  def index_of_1
    array = MyArray.new(6) {|i| i +1 }
    array.each_with_index {|v, i| return i if v == 1} == 0
  end

  def index_of_3
    array = MyArray.new(6) {|i| i +1 }
    array.each_with_index {|v, i| return i if v == 3} == 2
  end
end

MyArrayTest.new.run
