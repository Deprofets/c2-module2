def prioritize(array)
    p = array.reject{|x| not yield x}
    p + (array - p)
end

test_array = [2, 3, 4, 5]
puts prioritize(test_array) { |val| val > 3 }
# Should output: [4, 5, 2, 3]