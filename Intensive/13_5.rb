# http://ruby.qkspace.com/windows-problema-s-kodirovkoy-russkimi-bukvami
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

class Question
  def initialize(question_text, answers_text, score)
    @question_text = question_text.chomp
    @answers_text = answers_text.chomp
    @score = score.to_i
  end

  def score(answer)
    @answers_text.downcase == answer.chomp.downcase ? [@score, true] : [0, false]
  end

  def question_text
    @question_text
  end

  def answers_text
    @answers_text
  end
end

if !Dir.exist?('./data')
  puts "Директории data не существует."
  exit 1
end

files = Dir.children('./data')
if files.size == 0
  puts "Директория data пуста"
  exit 1
end

puts "Мини-викторина. Ответьте на вопросы.\n"

game_score = 0
correct_answeres = 0

files.sample(5).each do |filename|
  file_data = File.readlines("./data/" + filename, :encoding => "UTF-8")
  question = Question.new(file_data[0], file_data[1], file_data[2])

  #задаем вопрос
  puts "\n#{question.question_text}"
  answer = gets.encode("UTF-8").chomp

  #узнаем, правильный ли ответ
  question_score = question.score(answer)
  puts question_score[1] ? "Правильно!" : "Неправильно! Правильный ответ #{question.answers_text}"

  #апдейтим score и число правильных ответов
  game_score += question_score[0]
  correct_answeres += question_score[1] ? 1 : 0
end

puts "\nПравильных ответов #{correct_answeres} из 5"
puts "\nВы набрали #{game_score} баллов"
