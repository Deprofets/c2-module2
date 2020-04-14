def kaprekar?(k)
    og_len = k.to_s.length
    num = (k ** 2).to_s
    num.slice!(-og_len, og_len).to_i + num.to_i == k
end