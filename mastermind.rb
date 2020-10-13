code = (rand(8999) + 1000).to_s

print "Take a guess at the code: "
input = gets.chomp
guesses = 0
while input != code
  outputX = ""
  outputx = ""

  common = code.chars & input.chars
  common.each do |char|
    #all indexes of that char in code
    code_indexes = code.chars.map {|x| code.chars.index(char)}
    code_indexes.select! {|x| code.chars[x] == char}
    #all indexes of that char in input
    input_indexes = input.chars.map {|x| input.chars.index(char)}
    input_indexes.select! {|x| input.chars[x] == char}

    #if any indexes of the char match, then the char must be in the correct place
    if (code_indexes & input_indexes).length > 0 then outputX += "X" end
  end
  outputx =  "x" * (common.length - outputX.length)

  guesses += 1
  puts outputX + outputx
  print "Take a guess at the code: "
  input = gets.chomp
end

puts "Well Done! you took #{guesses} guesses!"
