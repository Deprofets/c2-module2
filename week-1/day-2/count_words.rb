def count_words str
    words = str.downcase.split
    Hash[words.map { |word| [word, words.count(word)]}]
end
