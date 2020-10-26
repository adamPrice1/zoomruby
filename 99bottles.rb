def verse(num)
  output = ""
  if num > 0
    output = """#{num} bottle of beer on the wall,
#{num} bottles of beer.
Take one down and pass it around,
no more bottles of beer on the wall."""
  else
    output = """No more bottles of beer on the wall,
no more bottles of beer.
Go to the store and buy some more,
99 bottles of beer on the wall."""
  end
  output
end

puts "How many bottles?"
input = gets.chomp

(input.to_i + 1).times {|i| puts verse(input.to_i - i)}
