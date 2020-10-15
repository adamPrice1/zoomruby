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

#Track how many guesses a player has made
num_guesses = 0

guessed_it = false

until num_guesses == 10 || guessed_it

puts "You've got #{10 - num_guesses} guesses left."
print "Your guess: "
guess = gets.to_i

num_guesses += 1

if guess < target
  puts "Too low!"
elsif guess > target
  puts "Too High!"
elsif guess == target
  puts "Good job #{name}!"
  puts "You took #{num_guesses} attempts!"
  guessed_it = true
end

end
unless guessed_it
  puts "Sorry you failed, it was #{target}"
end
