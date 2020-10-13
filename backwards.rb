print "what's your first and last name? : "
name = gets.chomp
puts name.split.reverse.join(" ")
