print "Amount deposited: "
amount = gets.strip.to_f
print "Interest rate (e.g. 1.5%): "
rate = gets.delete('%').strip.to_f
print "Periods: "
periods = gets.strip.to_i

periods.times { amount += amount*rate/100 } 

puts "After #{periods} periods you would have #{amount.round 2}"