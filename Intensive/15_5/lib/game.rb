class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end

  def errors
    return @user_guesses - normalize_letters(@letters)
  end

  def errors_made
    return errors.length
  end

  def errors_allowed
    return TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    result =
      @letters.map do |letter|
        if normalize_letters(@user_guesses).include?(letter)
          letter
        else
          nil
        end
      end

    return result
  end

  def lost?
    return errors_allowed == 0
  end

  def over?
    return won? || lost?
  end

  def play!(letter)
    if !over? && !normalize_letters(@user_guesses).include?(letter)
      @user_guesses << letter
    end
  end

  def won?
    return (@letters - normalize_letters(@user_guesses)).empty?
  end

  def word
    return @letters.join
  end

  #чето предложенный вариант выглядит избыточным и сложным, попробую свой
  def normalize_letters(array)
    rule = {"Е" => "Ё" , "Ё" => "Е", "И" => "Й", "Й" => "И"}
    array + array.map{|v| rule[v]}
  end
end
