
array = [1,2,3,4,5,6]

def map(array, &block)
  results = []
  array.each do |element|
    results << (yield element)
  end
  return results
end

def runner(array)
  map(array) do |number|
    number * number
  end
end

p runner(array)

