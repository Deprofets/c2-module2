# Print the hailstone sequence starting at x and return its length.
def hailstone(x)
    return unless x>0
    steps = 0;
    while x!=1
        if x.even?
            x/=2
        else
            x=x*3+1
        end
        puts x
    end
end