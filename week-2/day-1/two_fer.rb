def two_fer(name: "you")
  puts "One for #{name}, one for me."
end

print "who? "
name = gets.strip.capitalize
name.empty ? two_fer() : two_fer(name)
