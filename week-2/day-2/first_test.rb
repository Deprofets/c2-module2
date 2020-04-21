def assert_equal(expected, actual, method)
  if expected == actual
    puts "#{method} returned #{actual} as expected."
  else
    puts "KAPUTT! #{method} did not return #{expected} as expected, but actually returned #{actual}."
  end
end

def map(array)
  result = []
  for el in array do
    result << yield(el)
  end
  result
end

arr = [1, 2, 3]
assert_equal(arr, map(arr) { |x| x }, "map")
assert_equal([2, 4, 6], map(arr) { |x| x * 2 }, "map")
assert_equal([1, 8, 27], map(arr) { |x| x**3 }, "map")
