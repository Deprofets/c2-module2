def parts_sums(ls)
  arr = [0]
  ls.reverse.each { |x| arr.unshift(x + arr[0]) }
  arr
end
