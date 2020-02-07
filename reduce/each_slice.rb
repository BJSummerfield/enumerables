class MyArray < Array
  def each_slice(given_element, &block)
    i = 0
    a = []
    self.reduce([]) do |memo, element|
      memo = memo << element
      i += 1
      if i >= given_element
        a << memo
        memo = []
        i = 0
      end
      p i #wtf is going on here ?!?
      p memo
    end
    p a
  end
end

array = MyArray.new(6) {|i| i +1 }

array.each_slice(2)
