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

class Game
  def initialize(film_list)
    @producer_list = Hash.new{|h, k| h[k] = [] }
    film_list.each do |film|
      @producer_list[film.producer] << film.name
    end
  end

  def run
    puts "\nПрограмма «Фильм на вечер»"
    @producer_list.keys.each_with_index do |value, index|
      puts "#{index+1}: #{value}"
    end

    puts "\nФильм какого режиссера вы хотите сегодня посмотреть?"
    index = gets.to_i

    puts "И сегодня вечером рекомендую посмотреть:"
    producer = @producer_list.keys[index-1]
    puts "#{producer} — #{@producer_list[producer].sample}"
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

films = []
files.each do |filename|
  file_data = File.readlines("./data/" + filename, :encoding => "UTF-8", :chomp => true)
  films << Film.new(file_data[0], file_data[1], file_data[2])
end

game = Game.new(films)
game.run
