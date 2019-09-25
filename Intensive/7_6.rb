#the number to guess
number = rand(16)

puts "Загадано число от 0 до 15, отгадайте какое?"
for i in 1..3
  nextGuess = gets.to_i
  if (number - nextGuess).abs >= 3
    answer = "Холодно "
  elsif (number == nextGuess)
    puts "Ура, вы выиграли!"
    abort
  else
    answer = "Тепло "
  end
  
  if (number > nextGuess)
    answer += "(нужно больше)"
  else
    answer += "(нужно меньше)"
  end
  puts answer
end

puts "Было загадано число " + number.to_s

