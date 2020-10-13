# Get my Number game
# Written by Adam

puts "Welcome to 'Get My Number'!"
print "What's your name? "
input = gets
name = input.chomp

puts "Welcome #{name}!"

# Store a random number for the player to guess
puts "Can you guess my random number between 1 - 100?"
target = rand(100) + 1
