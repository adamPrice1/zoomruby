
print "Enter a Number: "
num1 = gets.chomp
while num1.to_i.to_s != num1
  print "Enter a Number: "
  num1 = gets.chomp
end

print "Enter a second Number: "
num2 = gets.chomp
while num2.to_i.to_s != num2
  print "Enter a second Number: "
  num2 = gets.chomp
end

puts "Your Max is #{[num1,num2].max}"
