array = [1,2,3,4,5,6,6,'cow']

def count(array, &block)
  if yield
    i = 0
    array.reduce([]) {|total, number| i += 1 if yield == number}
    return i
  else
    return array.length
  end
end

def runner(array)
  count(array) do |number|
    'cow'
  end
end

p runner(array)
