#the number to guess
number = rand(16)

puts "Загадано число от 0 до 15, отгадайте какое?"
3.times do
  next_guess = gets.to_i
  
  if (number - next_guess).abs >= 3
    is_cold = "Холодно"
  elsif (number == next_guess)
    puts "Ура, вы выиграли!"
    exit(0)
  else
    is_cold = "Тепло"
  end
  
  if number > next_guess
    is_greater = "(нужно больше)"
  else
    is_greater = "(нужно меньше)"
  end

  puts "#{is_cold} #{is_greater}"
end

puts "Было загадано число " + number.to_s
