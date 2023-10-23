class Car
 def initialize(brand)
  @brand = brand
  # puts "the object is now created"
 end
end

# car = Car.new
# outputs "the object..."

car = Car.new("Audi")

###############################

# Ruby has two types of methods: instance methods and class methods. A class method is supposed to provide functionality to the class itself and cannot be called directly on an instance, whereas an instance method provides functionality to the instance of the class and cannot be called on the class itself.
class Greetings
 def self.class_greetings
  puts "class method"
 end

 def instance_greetings
  puts "instance method"
 end
end

Greetings.class_greetings
Greetings.instance_greetings
#In order to call an instance method, you would first need to create an instance of the class and only that instance can call the instance method
ins = Greetings.new
ins.instance_greetings
