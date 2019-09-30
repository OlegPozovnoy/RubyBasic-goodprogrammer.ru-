def calc_BMI(height, weight)
  if (height <= 0 || weight <= 0)
    raise 'Incorrect arguments'
  end
  return weight / (height/100.0)**2
end

def decode_bmi(bmi)
  #первый элемент массива - граница интервала, 2й - включительно ли
  table = {
    [16, true] => 'Выраженный дефицит массы тела',
    [18.5, true]	=> 'Недостаточная (дефицит) масса тела',
    [25, true]	=> 'Норма',
    [30, true]	=> 'Избыточная масса тела (предожирение)',
    [35, true]	=> 'Ожирение',
    [40, false]	=> 'Ожирение резкое',
    [Float::INFINITY, false] => 'Очень резкое ожирение'
  }

  table.each_pair do |key, value|
    if bmi < key[0] || (bmi == key[0] && key[1])
      return value
    end
  end
end

puts "Введите ваш вес (в кг.):"
weight = gets.to_f

puts "Введите ваш рост (в см.):"
height = gets.to_f

bmi = calc_BMI(height, weight)
puts "\nВаш индекс: #{bmi.round(2)}"
puts "\n" + decode_bmi(bmi)
