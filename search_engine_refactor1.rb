# Things that are wrong here:
#
# 1. the reverse_index does not need to store full products, if the input arrays ID's correspond to the indices of an item then
# product data can still be retrived in O(n) time.
# 2. this solution is messy as we create an array of all words by first creating an array with all words in it multiple times.
# This is not a scaleable solution. The best option here is probably a set data structure from a memory perspective.
# In reality this would probably be some sort of tree/set combination.
# 3. Obviously this solution is not designed in an OOP fashion, and is quite hard to wrap your head around.
# 4. implementing or statements is simply an issue of changing intersection to concatenation, but doing so would add duplicate code,
# so the need for refactoring further is clear
#


require 'json'

puts "Pre-processing...."

file = File.read('search_engine_input.json')
data = JSON.parse(file)

name_words = []

data.each { |prod| name_words.concat prod["name"].downcase.split }

name_words.uniq!

reverse_index = Hash.new {|hash, key| hash[key] = [] }

name_words.each do |word|
  data.each { |prod| reverse_index[word].push(prod) if prod["name"].downcase.include?(word) }
end

puts "Done!"

print "search: "
input = gets.chomp.downcase

if input.split.length > 1
  result = []
  input.split.each do |word|
    if result.empty?
      result = reverse_index[word]
    else
      result = result.intersection(reverse_index[word])
    end
  end
  puts "we found #{result.length} matching products"
  result.each {|prod| puts prod.to_s }
else
  if reverse_index[input]
    puts "we found #{reverse_index[input].length} matching products"
    reverse_index[input].each {|prod| puts prod.to_s }
  else
    puts "No matches"
  end
end
