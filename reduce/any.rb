array = [1,2,3,4,5,6]

def map(array, &block)
  return true if array == []
  array.reduce([]) {|total, number| return true if (yield number) == true}
  return false
end

def runner(array)
  map(array) do |number|
    number != 4
  end
end

p runner(array)
