# http://ruby.qkspace.com/windows-problema-s-kodirovkoy-russkimi-bukvami
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

if  !Dir.exist?('./data')
  puts "Директории data не существует."
  abort
end if

files = Dir.children('./data')
if files.size == 0
  puts "Директория data пуста"
  abort
end

puts "Мини-викторина. Ответьте на вопросы.\n"

correct_answeres = 0

files.sample(3).each do |filename|
  file = File.new("./data/" + filename,"r:UTF-8")
  file_data =  file.readlines
  file.close
  puts "\n" + file_data[0]
  answer = gets.encode("UTF-8").chomp

  if file_data[1].downcase.eql?(answer.downcase)
    puts "Правильно!"
    correct_answeres+=1
  else
    puts "Неправильно! Правильный ответ #{file_data[1]}"
  end
end

puts "\nПравильных ответов #{correct_answeres} из 3"