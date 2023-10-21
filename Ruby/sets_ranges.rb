require 'set'
my_set = Set.new([5,2,9,3,1])
print my_set
puts " "
my_set.each do |x|
 puts x
end
puts "-"
my_set << 8
my_set.add 20
puts my_set
my_set.add 8
puts my_set
#
puts "-"
for count in 1...10 #exclude last
 puts count
end
#
puts "-"
for count in 20..30 #include last
 puts count
end 
puts "-"
 my_range = Range.new(1, 10)
 my_range.each {|i| puts i}
