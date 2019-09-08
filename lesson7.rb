a = 0

puts "Enter the first num"
a+= gets.chomp.to_f
puts "Enter the 2nd num"
a+= gets.to_f
puts "Enter the 3rd num"
a+= gets.chomp.to_f

puts "The avg is " + (a/3).round(6).to_s