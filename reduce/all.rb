array = [1,2,3,4,5,6]

def map(array, &block)
  array.reduce([]) {|total, number| return false if (yield number) == false}
  return true
end

def runner(array)
  map(array) do |number|
    number != 4
  end
end

p runner(array)
