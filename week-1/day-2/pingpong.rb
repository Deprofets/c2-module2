def pingpong x
    seq = []
    change = 1
    current = 1
    for i in (1..30) do
        seq << current
        change*=-1 if i.digits.include? 7 or i % 7 == 0
        current += change
    end
    seq[x-1]
end