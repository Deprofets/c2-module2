def number_shuffle(number)
    number.to_s
    .split('')
    .permutation
    .to_a
    .map { |digit_arr| digit_arr.join.to_i }
end