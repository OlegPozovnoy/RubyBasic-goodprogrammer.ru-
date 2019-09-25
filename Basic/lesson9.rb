arr = []

i = 0
while (i<10) do
    arr.push(rand(100))
    i+=1
end

puts arr.to_s

max = arr[0]

for item in arr
    if item > max
        max = item
    end
end

puts max