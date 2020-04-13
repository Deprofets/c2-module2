def palindrome?(sentence)
    lower = sentence.downcase.delete ' '
    return lower == lower.reverse
end