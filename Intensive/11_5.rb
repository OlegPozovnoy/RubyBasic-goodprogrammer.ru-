# http://ruby.qkspace.com/windows-problema-s-kodirovkoy-russkimi-bukvami
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

def sklonyator(number, forms_0, forms_1, forms_2)
  if number < 0
    return ("С отрицательными и мнимыми числами не работаем.")
  end

  last_digit = number % 10
  if [0, *5..9].include?(last_digit) || (11..14).include?(number % 100)
    return "Вот вам #{number} #{forms_2}"
  elsif last_digit.between?(2, 4)
    return "Вот вам #{number} #{forms_1}"
  elsif last_digit == 1
    return "Вот вам #{number} #{forms_0}"
  end
end

forms = ['крокодил', 'крокодила', 'крокодилов']

puts "Сколько вам #{forms[2]}?"
number = gets.encode("UTF-8").strip

if number.to_i.to_s.eql?(number)
  puts "\n" + sklonyator(number.to_i, *forms)
else
  puts ("Введено не целое число")
end
