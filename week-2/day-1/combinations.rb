students = "Gerard Altamirano, Orlando Rojas, Franco Flores, Fernando Pareja, Zamir Narro, Jorge Gonzales, Rai Delgado, Gustavo Panebra, Benjamin Maguiña, Marcelo Nuñez, Mariella Ugarte, Joel Eche, Ricardo Huamani, Alexander Chavarria, Erick Saavedra, Freddy Munive, Adonai Luque, Jorge Alayo, Saida del Valle, Alessandro Chumpitaz, Sebastian Zanabria, Nicolle Quispe, Robert Medina, Victor Rodriguez, Andres Del Carpio, Wilber Carrascal, Joaquin Meza, Marvin Carrasco, Humberto Delgado, Elvis Quispe".split(', ')

$base = students.combination(2).to_a

possibilities = []

$base.each do |pair|
  students.each do |student|
    next if pair.include? student
    guess = [*pair, student]
    possibilities.push(guess) if possibilities.none? do |group|
      (group.include?(pair[0]) && group.include?(pair[1])) ||
      (group.include?(pair[0]) && group.include?(student)) ||
      (group.include?(pair[1]) && group.include?(student))
    end
  end
end

$result = possibilities
