puts "Курс доллара:"
fx_rate = gets.to_f.round(2)
puts "Сколько у вас рублей?"
rubles = gets.to_f.round(2)
puts "Сколько у вас долларов?"
usd = gets.to_f.round(2)

#Coputing the amount in USD to be bought to balance the portfolio
#rounded to the nearest cent
diff_in_usd = ( (rubles/fx_rate - usd)/2).round(2)

if (diff_in_usd  > 0)
  puts "Вам надо купить " + diff_in_usd.to_s + "$"
elsif (diff_in_usd  < 0)
  puts "Вам надо продать " + diff_in_usd.abs.to_s + "$"
else
  puts "Поздравляем, портфель сбалансирован"
end
