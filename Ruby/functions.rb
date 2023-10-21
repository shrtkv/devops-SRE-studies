def greetings
 puts "Hello"
end

greetings 

 def greetings_with_name(name="Emily")
  puts "Hello #{name}!"
 end 

 greetings_with_name
#
 def sum(x,y) 
 x+y 
 end 
 puts sum(2,0)
#
 greetings_with_name("John")
#
 def optional_arguments(*a)
  puts a
 end 

 optional_arguments("Hello", "World", 2024)
#
 puts "-"
 def prod(x,y)
 res =x*y
 return res
 end

 result = prod(2,5)
 puts result
#  anything after the return will never be executed. 
def explicit_return
 puts 'I am placed before return call'

 return 'I am the return call'

 puts 'I will never be executed'
end
puts explicit_return
puts "-"
# If a function lacks an explicit return statement, then Ruby will return the value of the last executed instruction
def prod(x, y)
 x*y
end

puts prod(2, 5)
puts "-"
#In the implicit_return method, the if condition evaluates to true. Since the last executed instruction is x = true, the method implicitly returns true and when called like above, it outputs true to the screen.
def implicit_return
 x = 10
 if x == 10
  x = true
 else
  x = false
 end
end

puts implicit_return
