def map(arr)
    for x in arr do
        arr[arr.index x] = yield x
    end
end

test_array = [2, 3, 4, 5]
puts map(test_array) { |element| element * 3}
# Result: [6, 9, 12, 15]