def reduce(arr, initial)
    for x in arr do
        initial = yield initial,x
    end
    initial
end

test_array = [2, 3, 4, 5]
puts reduce(test_array, 0) { |total_sum, current_value| total_sum + current_value }
# Result: 14
# The execution of the method would be:
# First execution the block is provided the arguments 0 (initial value) and 2 (current value). It sums the values, returns 2.
# Second execution the block is provided the arguments 2 (last result) and 3 (current value). It sums the values and returns 5.
# Third execution the block is provided the arguments 5 (last result) and 4 (current value). It sums the values and returns 9.
# Forth execution the block is provided the arguments 9 (last result) and 5 (current value). It sums the values and returns 14.
# The last iteration returns 14, and that is the value that the method returns.