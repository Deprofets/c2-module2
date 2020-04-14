def intersection(*arrays)
    values=arrays.flatten.uniq
    values.reduce([]) do |arr,x|
        arr << x if arrays.all?{|inner|inner.include? x}
        arr
    end
end

puts intersection([5, 10, 15, 20], [15, 88, 1, 5, 7], [1, 10, 15, 5, 20])
# Should output: [5, 15]