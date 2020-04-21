def my_languages(results)
  # your code here
  results.keys.select { |k| k if results[k] >= 60 }.sort { |a, b| results[b] <=> results[a] }
end
