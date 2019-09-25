# http://ruby.qkspace.com/windows-problema-s-kodirovkoy-russkimi-bukvami
if (Gem.win_platform?)
    Encoding.default_external = Encoding.find(Encoding.locale_charmap)
    Encoding.default_internal = __ENCODING__
  
    [STDIN, STDOUT].each do |io|
      io.set_encoding(Encoding.default_external, Encoding.default_internal)
    end
  end

shoppingList = [
  "масло",
  "молоко",
  "хлопья",
  "картошка",
  "курица",
  "помидоры"
]


while shoppingList.size > 0 do
  puts "Нужно купить:"
  puts shoppingList.to_s
  puts "\nЧто купили:"
  nextItem = gets.encode("UTF-8").chomp
  #puts shoppingList[0].bytes
  puts
  #puts nextItem.bytes
  shoppingList.delete(nextItem)
end