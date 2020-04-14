def filter(arr)
    arr.delete_if {|x| yield x}
end

test_array = [2, 3, 4, 5]
puts filter(test_array) { |element| element > 3}
# Result: [4, 5] -> numbers 2 and 3 were removed