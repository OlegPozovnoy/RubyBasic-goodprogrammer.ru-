result = "".encode("ASCII")

for i in 1..8
  code = rand(10+26+26)
  if (code < 10)
    result += ('0'.ord + code).chr
  elsif (code < 36)
    result += ('a'.ord + code - 10).chr
  else
    result += ('A'.ord + code - 36).chr
  end
end

#puts result.encoding
puts result.encode("UTF-8")
