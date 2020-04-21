class NotAnInt < ArgumentError
end
class NotPositiveInt < ArgumentError
end

def put_n(text, times)
  raise NotAnInt if !times.is_a? Integer
  raise NotPositiveInt if !times.positive?
  times.times { puts text }
end

def echo
  puts "What do you want to echo?"
  text = gets.strip
  puts "How many times do you want to repeat it?"
  times = gets.strip
  put_n(text, times)
rescue
  puts "I don't understand how many times do you want to echo the string!"
  retry
end
