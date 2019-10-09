class Film
  def initialize(name, producer, year)
    @name = name.chomp
    @producer = producer.chomp
    @year = year.to_i
  end

  def name
    @name
  end

  def producer
    @producer
  end

  def year
    @year
  end
end

class Question
  def initialize(film, producer_list)
    @film = film
    @producer_list = producer_list
  end

  def film
    @film
  end

  def producer_list
    @producer_list
  end
end

class Game
  def initialize(film_list, questions_num)
    producer_list = []
    film_list.each do |film|
      producer_list << film.producer
    end

    @questions = []
    film_list.sample(questions_num).each do |film|
      @questions << Question.new(film, [film.producer] + (producer_list.uniq - [film.producer]).sample(3))
    end
  end

  def run
    score = 0
    @questions.each do |question|
      #задаем вопрос
      puts "\nКто снял «#{question.film.name}» (#{question.film.year})?\n"
      question.producer_list.shuffle!
      question.producer_list.each_with_index do |value, index|
        puts "#{index+1}. #{value}"
      end
      answer = gets.to_i

      if question.producer_list[answer-1] == question.film.producer
        score +=1
        puts "Верно!"
      else
        puts "Неправильно! Правильный ответ — #{question.film.producer}."
      end
    end
    puts "\nВы угадали #{score} режиссеров из #{@questions.size}"
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

films = []
files.each do |filename|
  file_data = File.readlines("./data/" + filename, :encoding => "UTF-8", :chomp => true)
  films << Film.new(file_data[0], file_data[1], file_data[2])
end

game = Game.new(films,3)
game.run
