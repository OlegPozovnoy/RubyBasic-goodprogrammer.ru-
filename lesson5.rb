time = Time.now

puts time

if (time.wday == 6 || time.wday==0)
    puts "weekend"
else
    puts "work day"    
end
