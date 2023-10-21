x = 10


if x > 7
 puts "x is greater than 7"
elsif x < 7
 puts "x is lower than 7"
else 
 puts "x is #{x}"
end

on = true

# a menos que (unless)
# When the provided condition is false, this statement is executed.
unless on
 puts  "the device is off"
else 
 puts "the device is on"
end


num = 0

case num
when 0
 puts "Zero"
when 1
 puts "One"
when 2
 puts "Two"
else
 puts "The entered number is greater than 2"
end
