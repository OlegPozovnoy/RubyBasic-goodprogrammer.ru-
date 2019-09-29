# http://ruby.qkspace.com/windows-problema-s-kodirovkoy-russkimi-bukvami
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

def read_questions
  file_path = "9_2_questions.txt"
  if File.exist?(file_path)
    f = File.new(file_path, "r:UTF-8")
    lines = f.readlines
    f.close
    return lines
  else
    raise "Файл #{file_path} не найден"
  end
end

def read_results
  results = {}

  file_path = "9_2_results.txt"
  if File.exist?(file_path)
    f = File.new(file_path, "r:UTF-8")
    lines = f.readlines
    f.close
    lines.each{ |item|
      result = item.split('=>')
      results[result[0].to_i] = result[1]
    }
    return results
  else
    raise "Файл #{file_path} не найден"
  end
end

#очки за вопросы
answers = {"да" => 2, "иногда" => 1, "нет" => 0}

#индексы вопросов, в которых ответ "да" означает коммуникабельность
reverse_meaning = [4,9,10]

questions = read_questions
results = read_results

score = 0

questions.each { |question|
  puts question
  answer = gets.encode("UTF-8").chomp

  while !answers.keys.include?(answer)
    puts "Некорректный ввод, допустимые варианты ответа " + answers.keys.to_s
    puts "Введите ответ заново"
    answer = gets.encode("UTF-8").chomp
  end
  score += reverse_meaning.include?(questions.index(question)) ? 2 - answers[answer] : answers[answer];
}

puts "Вы набрали #{score} очков"

results.each_pair{|key, value|
  if key <= score
    puts results[key]
    return
  end
}