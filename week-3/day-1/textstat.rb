require 'textstat'
test_data = %(
  Playing games has always been thought to be important to
 the development of well-balanced and creative children
 however, what part, if any, they should play in the lives
 of adults has never been researched that deeply. I believe
 that playing games is every bit as important for adults
 as for children. Not only is taking time out to play games
 with our children and other adults valuable to building
 interpersonal relationships but is also a wonderful way
 to release built up tension.
)

def reading_grade(text)
  p grade = TextStat.coleman_liau_index(text).round
  case
  when grade > 16 then "Grade 16+."
  when grade < 1 then "Before Grade 1."
  else "Grade #{grade}."
  end
end

reading_grade(test_data)

=begin 
reading_grade(%(One fish. Two fish. Red fish. Blue fish. and press enter.)) == "Before Grade 1."
reading_grade(%(Would you like them here or there? I would not like them here or there. I would not like them anywhere. and press enter.)) == "Grade 2."
reading_grade(%(Congratulations! Today is your day. You're off to Great Places! You're off and away! and press enter.)) == "Grade 3."
reading_grade(%(Harry Potter was a highly unusual boy in many ways. For one thing, he hated the summer holidays more than any other time of year. For another, he really wanted to do his homework, but was forced to do it in secret, in the dead of the night. And he also happened to be a wizard. and press enter.)) == "Grade 5."
reading_grade(%(In my younger and more vulnerable years my father gave me some advice that I've been turning over in my mind ever since. and press enter.)) == "Grade 7."
reading_grade(%(Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, "and what is the use of a book," thought Alice "without pictures or conversation?" and press enter.)) == "Grade 8."
reading_grade(%(When he was nearly thirteen, my brother Jem got his arm badly broken at the elbow. When it healed, and Jem's fears of never being able to play football were assuaged, he was seldom self-conscious about his injury. His left arm was somewhat shorter than his right; when he stood or walked, the back of his hand was at right angles to his body, his thumb parallel to his thigh. and press enter.)) == "Grade 8."
reading_grade(%(There are more things in Heaven and Earth, Horatio, than are dreamt of in your philosophy. and press enter.)) == "Grade 9."
reading_grade(%(It was a bright cold day in April, and the clocks were striking thirteen. Winston Smith, his chin nuzzled into his breast in an effort to escape the vile wind, slipped quickly through the glass doors of Victory Mansions, though not quickly enough to prevent a swirl of gritty dust from entering along with him. and press enter.)) == "Grade 10."
reading_grade(%(A large class of computational problems involve the determination of properties of graphs, digraphs, integers, arrays of integers, finite families of finite sets, boolean formulas and elements of other countable domains. and press enter.)) == "Grade 16+."
=end