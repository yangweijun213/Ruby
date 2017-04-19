def divude (x)
  raise ArgumentError if x==0
end

begin 
  divide(0)
rescue ArgumentError
  puts "ArgumentError"
end