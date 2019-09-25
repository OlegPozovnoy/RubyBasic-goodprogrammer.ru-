#system "cls"
require "./methods.rb"

letters = get_letters()
puts letters.to_s

good_letters = []
bad_letters = []
 
while bad_letters.size < 7 do
    puts "while loop start"
    print_status(letters, good_letters, bad_letters, "not used")
    user_input = get_user_input()
    check_result(user_input, letters, good_letters, bad_letters)
end