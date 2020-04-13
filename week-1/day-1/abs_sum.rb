print "What is the value of first number? "
#No need to trim but do it anyway
a = gets.strip.to_f
print "What is the value of second number? "
b = gets.strip.to_f

sum = a+b


puts sum<0 ? sum*-1 : sum
