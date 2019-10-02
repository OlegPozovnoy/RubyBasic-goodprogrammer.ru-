require 'open-uri'
require 'json'

def random_cat_fact
  data = open("https://cat-fact.herokuapp.com/facts/random").read
  json = JSON.parse(data)

  return json["text"]
end

puts "Пользователь, сколько Вам фактов о котах выдать?"
num_of_facts = gets.to_i

num_of_facts.times do |i|
  puts "#{i+1}.#{random_cat_fact}"
end
