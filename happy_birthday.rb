print "Hi What's your name? "
name = gets.chomp

i = 0
until i == 4
  case i
   when 2
    end_of_line = "dear #{name}"
   when 3
    end_of_line = "to you."
  else
    end_of_line = "to you"
  end
  puts "Happy birthday #{end_of_line}"
  i += 1
end
