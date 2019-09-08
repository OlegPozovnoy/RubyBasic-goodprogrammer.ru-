def circle_area(r)
    return Math::PI * r**2
end

def subarray(array)
    size = STDIN.gets.to_i
    return array.take(size)
end

def generalisimus(size)
    str = ""
    for i in 1..size
        str+="*"
    end    
    return str
end

# puts circle_area(1)
# puts subarray([1,2,3,4,5]).to_s

puts generalisimus(30)