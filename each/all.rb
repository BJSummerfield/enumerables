array = [1,2,3,4,5,6]

def all(array, &block)
  array.each do |element|
    return false if (yield element) == false
  end
  return true
end

def runner(array)
  all(array) do |number|
    number != 8
  end
end

p runner(array)
