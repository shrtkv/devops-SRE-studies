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
my_2d_array = [[1,2,3], [4,5,6]]
my_2d_array.each {|x| puts "#{x}\n"}
puts my_2d_array[1][1]
#
puts "-"
my_array = [5,9,8,2,6]
puts my_array.include?(0)
puts my_array.include?(2)
puts my_array.sort
print my_2d_array.flatten
my_array.each {|item| puts item}
print my_array.map {|item| item*2}
# hashs
puts "-"
person_hash = {
 "name" => "John",
 "age" => 25
}

puts person_hash

puts person_hash["name"]
puts person_hash["age"]
person_hash["gender"] = "male"
puts person_hash
person_hash.delete("gender")
puts person_hash
person_hash.each do |key, value|
 puts "#{key} is #{value}"
end
puts "-"
puts person_hash.has_key?("name")
puts person_hash.has_key?("height")
puts person_hash.select{|key, value| key == "name"}
puts person_hash.fetch("name")
