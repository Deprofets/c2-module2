def union(*arrays)
    arrays.flatten.uniq
    #arrays.flatten.reduce([]) do |arr,x|
    #    arr << x unless arr.include? x
    #     arr
    #end
end

puts union([5, 10, 15], [15, 88, 1, 5, 7], [100, 15, 10, 1, 5])
# Should output: [5, 10, 15, 88, 1, 7, 100]