IDEAL_GAS_CONSTANT = 8.314
def calculate_pressure(chemical_amount, temperature, volume)
    (chemical_amount * IDEAL_GAS_CONSTANT * temperature)/volume
end

puts calculate_pressure(5, 500, 2) # Returns 10392.5