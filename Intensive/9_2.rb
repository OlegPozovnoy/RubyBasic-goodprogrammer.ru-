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
    return File.readlines(file_path, :encoding => "UTF-8")
  else
    raise "Файл #{file_path} не найден"
  end
end

def read_results
  results = {}

  file_path = "9_2_results.txt"
  if File.exist?(file_path)
    File.readlines(file_path, :encoding => "UTF-8").each do |item|
      result = item.split('=>')
      results[result[0].to_i] = result[1]
    end
    return results
  else
    raise "Файл #{file_path} не найден"
  end
end

question_tail = "(введите 2 если да, 1 если иногда, 0 если нет)"
#Допустимый ввод пользователя
answers = ["2", "1", "0"]

#индексы вопросов, в которых ответ "да" означает коммуникабельность
reverse_meaning = [4, 9, 10]

questions = read_questions
results = read_results

score = 0

questions.each_with_index do |question, index|
  puts "#{question.chomp}\n#{question_tail}"
  answer = gets.chomp

  until answers.include?(answer)
    puts "Некорректный ввод, допустимые варианты ответа #{answers}"
    puts "Введите ответ заново"
    answer = gets.chomp
  end
  score += reverse_meaning.include?(index) ? 2 - answer.to_i : answer.to_i
end

puts "Вы набрали #{score} очков"

results.each_pair do |key, value|
  if key <= score
    puts value
    return
  end
end
