# http://ruby.qkspace.com/windows-problema-s-kodirovkoy-russkimi-bukvami
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

def sklonyator(number, *forms)
  if !number.is_a? Integer
    puts ("Первый аргумент не целое число, выполнение программы будет прекращено")
    abort
  elsif forms.size != 3
    puts ("Должно быть передано 3 формы склолнения, выполнение программы будет прекращено")
    abort
  elsif number < 0
    puts ("С отрицательными и мнимыми числами не работаем, выполнение программы будет прекращено")
    abort
  end

  if number == 1
    return "Вот вам #{number} #{forms[0]}"
  elsif number >=2 && number <= 4
    return "Вот вам #{number} #{forms[1]}"
  elsif number >= 5 || number == 0
    return "Вот вам #{number} #{forms[2]}"
  end
end

forms = ['крокодил', 'крокодила', 'крокодилов']

puts "Сколько вам #{forms[2]}?"
number = gets.encode("UTF-8").to_i

puts "\n" + sklonyator(number, *forms)
