def get_letters()
    puts ARGV.to_s
    word  = ARGV[0].encode("UTF-8").chomp
    puts word
    if (word == nil || word.size == 0)
        abort "the word is empty"
    end
    return word.split("")
end


def get_words_for_print(letters, good_letters)
    word = ""
    for i in 0...letters.size
        if good_letters.include?(letters[i])
            word += letters[i].to_s
        else
            word += "_"
        end
    end
    return word
end

def print_status(letters, good_letters, bad_letters, errors)
    puts "\n" + get_words_for_print(letters, good_letters)
    puts "\nThe following letters are not in the word: " + bad_letters.to_s 

    if (letters - good_letters).empty?
        abort "\nCongrats, You've won!"
    end
end

def get_user_input()
    puts "\nEnter the next letter"
    letter = STDIN.gets
    puts letter
    puts letter.encode("UTF-8") 

    return STDIN.gets.encode("UTF-8").chomp
end

# 0 — пользователь отгадал букву или такая буква уже была
# 1 — пользователь отгадал букву и всё слово
# -1 — пользователь ошибся и такой буквы нет
def check_result(user_input, letters, good_letters, bad_letters)

    if (good_letters.include?(user_input) || bad_letters.include?(user_input))
        puts "\nYou've already named this letter"
        return 0
    end

    if (is_include(letters,user_input) )
        good_letters.push(user_input)

        letter_identity(user_input, good_letters)
   
        if (letters - good_letters).empty?
            puts "\nYou've guessed the whole word"
            return 1
        else
            puts "\nThe secred word contains this letter!"
            return 0
        end    
    else
        bad_letters.push(user_input)
        letter_identity(user_input, bad_letters)
        puts "\nThere's no such letter in the word"
        return -1
    end

end


def letter_identity(letter, array)
    if (letter == "и")
        array.push("й")
    elsif (letter == "й")
        array.push("и")
    elsif (letter == "е")
        array.push("ё")
    elsif (letter == "ё")
        array.push("е")
    end
end


def is_include(letters, user_input)
    if (letters.include?("ё") && user_input == "е") ||
        (letters.include?("е") && user_input == "ё")
        (letters.include?("й") && user_input == "и")
        (letters.include?("и") && user_input == "й")
        return true
    else
        return letters.include?(user_input)
    end

end