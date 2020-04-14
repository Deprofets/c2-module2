def sum_of_cubes(a, b)
    (a..b).to_a.reduce (0) {|a,x| a+=x**3}
end