print "Amount deposited: "
amount = gets.strip.to_f
print "Interest rate (e.g. 1.5%): "
rate = gets.delete('%').strip.to_f
print "Periods: "
periods = gets.strip.to_i

current_period = 0;
while current_period < periods
    amount*=(100+rate)/100
    current_period+=1;
end

puts "After #{periods} periods you would have #{amount.round 2}"