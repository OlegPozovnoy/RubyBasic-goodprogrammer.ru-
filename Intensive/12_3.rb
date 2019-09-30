def calc_usd_to_buy(fx_rate, rubles, usd)
  if fx_rate <= 0
    return 'Ошибка. Курс доллара не может быть отрицательным.'
  end

  diff_in_usd = ((rubles/fx_rate - usd) / 2.0).round(2)
  if diff_in_usd > 0
    "Вам надо купить #{diff_in_usd}$"
  elsif diff_in_usd  < 0
    "Вам надо продать #{diff_in_usd.abs}$"
  else
    "Поздравляем, портфель сбалансирован"
  end
end

puts "Курс доллара:"
fx_rate = gets.to_f
puts "Сколько у вас рублей?"
rubles = gets.to_f
puts "Сколько у вас долларов?"
usd = gets.to_f

puts calc_usd_to_buy(fx_rate, rubles, usd)
