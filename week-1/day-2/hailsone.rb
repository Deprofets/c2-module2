# Print the hailstone sequence starting at x and return its length.
def hailstone(x)
  return unless x > 0
  until x == 1
    puts x.even? ? x /= 2 : x = x * 3 + 1
  end
end
