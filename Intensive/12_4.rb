def calc_BMI(height, weight)
  begin
    if (height <= 0 || weight <= 0)
      raise 'Incorrect arguments'
    end
    return weight / (height**2/100.0**2)
  rescue => exception
    puts exception.message
    abort
  end
end

def decode_bmi(bmi)
  table = {
    16 => 'Выраженный дефицит массы тела',
    18.5	=> 'Недостаточная (дефицит) масса тела',
    25	=> 'Норма',
    30	=> 'Избыточная масса тела (предожирение)',
    35	=> 'Ожирение',
    40	=> 'Ожирение резкое',
    Float::INFINITY => 'Очень резкое ожирение'
  }

  table.each_pair{|key, value|
    if bmi < key
      return value
    end
  }
end

puts "Введите ваш вес (в кг.):"
weight = gets.to_f

puts "Введите ваш рост (в см.):"
height = gets.to_f

bmi = calc_BMI(height, weight)
puts "\nВаш индекс: #{bmi.round(2)}"
puts "\n" + decode_bmi(bmi)
