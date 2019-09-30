# http://ruby.qkspace.com/windows-problema-s-kodirovkoy-russkimi-bukvami
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

def sklonyator(number, forms_0, forms_1, forms_2)
  if !number.is_a? Integer
    puts ("Первый аргумент не целое число, выполнение программы будет прекращено")
    abort
  elsif number < 0
    puts ("С отрицательными и мнимыми числами не работаем, выполнение программы будет прекращено")
    abort
  end

  if number % 10 >= 5 || [0, *11..14].include?(number % 100)
    return "Вот вам #{number} #{forms_2}"
  elsif number % 10 >=2 && number % 10 <= 4
    return "Вот вам #{number} #{forms_1}"
  elsif number % 10 == 1
    return "Вот вам #{number} #{forms_0}"
  end
end

forms = ['крокодил', 'крокодила', 'крокодилов']

puts "Сколько вам #{forms[2]}?"
number = gets.encode("UTF-8").to_i

puts "\n" + sklonyator(number, forms[0], forms[1], forms[2])
