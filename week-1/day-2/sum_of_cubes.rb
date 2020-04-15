def sum_of_cubes(a, b)
  (a..b).reduce(0) { |sum, x| sum + x**3 }
end