print "Enter a year: "
year = gets.chomp
while year.to_i.to_s != year or year.to_i < 0
  print "Enter an actual year please: "
  year = gets.chomp
end

if year.to_i % 4 == 0 && year.to_i % 100 != 0
  puts "Yup, #{year} is a leap year"
elsif year.to_i % 4 == 0 && year.to_i % 400 == 0
  puts "Yup, #{year} is a leap year"
else
    puts "Yup, #{year} is not a leap year"
end
