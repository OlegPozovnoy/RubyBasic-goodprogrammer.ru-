# http://ruby.qkspace.com/windows-problema-s-kodirovkoy-russkimi-bukvami
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

str_to_check = ''

loop do
  puts "Введите строку, которую надо проверить на «палиндромность»:"
  str_to_check = gets.encode("UTF-8")
  break unless str_to_check.strip.empty?
end

str_encoded = str_to_check.gsub(/[^[а-яА-Яa-zA-Z0-9]]/,'').downcase

if str_encoded.eql?(str_encoded.reverse)
  puts "Да, это палиндром"
else
  puts "Нет, это не палиндром"
end
