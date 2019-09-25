puts "Курс доллара:"
fxRate = gets.encode("UTF-8").to_f.round(2)
puts "Сколько у вас рублей?"
rubles = gets.encode("UTF-8").to_f.round(2)
puts "Сколько у вас долларов?"
usd = gets.encode("UTF-8").to_f.round(2)

#Coputing the amount in USD to be bought to balance the portfolio
#rounded to the nearest cent
dUSD = (usd - (rubles/fxRate + usd)/2).round(2)

if (dUSD > 0)
  puts "Вам надо купить " + dUSD.to_s + "$"
elsif (dUSD < 0)
  puts "Вам надо продать " + (-dUSD).to_s + "$"  
else
  puts "Поздравляем, портфель сбалансирован"
end
