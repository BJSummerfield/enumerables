array = [1,2,3,4,5,6]

def map(array, &block)
  return array.reduce([]) {|total, number| total << (yield number)}
end

def runner(array)
  map(array) do |number|
    number * number
  end
end

p runner(array)
