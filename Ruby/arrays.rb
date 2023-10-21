months = ["January", "February", "March", "April", "May", "June", "July"]
puts months[6]
puts "-"
months << "August"
puts months
puts "-"
months.push("September")
puts months
puts "-"
months.insert(2, "October")
puts months
puts "-"
months.pop
puts months
puts "-"
months.delete_at(2)
puts months
#
puts "-"
my_2d_array = [[1, 2, 3], [4, 5, 6]]
my_2d_array.each { |x| puts "#{x}\n" }
puts my_2d_array[1][1] # returns 5
