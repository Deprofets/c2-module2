def summation(n)
    (1..n).to_a.map {|x| yield x}
    .reduce {|sum, x| sum+x}
end
  
puts summation(3) { |val| val * 2 } # 1 * 2 + 2 * 2 + 3 * 2 = 12