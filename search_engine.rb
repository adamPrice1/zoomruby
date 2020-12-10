# 1. do pre-processing in order to make a reverse index of unique words
# 2. take input and output matches.

# first iteration
# only full matches, no partial matches or misspellings

#pre-processing
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

if reverse_index[input]
  puts "we found #{reverse_index[input].length} matching products"
  reverse_index[input].each {|prod| puts prod.to_s }
else
  puts "No matches"
end
