print "Hi What's your name? "
name = gets.chomp

i = 0
while i < 4
  if i == 2
    puts "Happy birthday dear #{name}"
  else
    puts "Happy birthday to you"
  end
  i += 1
end
