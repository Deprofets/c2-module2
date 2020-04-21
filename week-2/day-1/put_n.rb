class NotAnInt < ArgumentError
end
class NotPositiveInt < ArgumentError
end

def put_n(text, times)
  raise NotAnInt if !times.is_a? Integer
  raise NotPositiveInt if !times.positive?
  times.times { puts text }
rescue NotAnInt
  puts "Argument is not an integer"
rescue NotPositiveInt
  puts "Argument is not a positive integer"
end
