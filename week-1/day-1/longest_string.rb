def longest_string(string_a, string_b)
    if string_a.length > string_b.length
        puts string_a
    else
        puts string_b
    end
end

longest_string("I am the longest.", "No, you are not the longest; liar.")