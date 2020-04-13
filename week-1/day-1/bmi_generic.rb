print "Show me the weight (kg): "
w = gets.strip.to_f
print "Show me the height (m): "
h = gets.strip.to_f
bmi = w/h**2
puts bmi.round 2