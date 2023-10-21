learn = ["blocks", "yields", "functions"]

learn.each do |item|
 puts "I am learning #{item}"
end
puts "-"
# Using yield inside a method will allow us to call the method with a block of code that will be inserted in place of the yield keyword. In other words, when the method gets to the yield keyword, it executes the block passed to the method, then continues with any code after the yield keyword.

def yielding_test
 puts "We're now in the method!"
 yield
 puts "We're back in the method!"
end
yielding_test { puts "The method has yielded to the block and We're in the block now!" }
#
def yield_greetings(name)
 puts "We're now in the method!"
 yield("Emily")
 puts "In between the yields!"
 yield(name)
 puts "We're back in method."
end

yield_greetings("Erick") { |n| puts "Hello #{n}." }
