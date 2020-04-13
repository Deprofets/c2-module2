print "who? "
name = gets.strip.capitalize
name = "you" unless not name.empty?

puts "One for #{name}, one for me."