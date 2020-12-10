# Things that are wrong here:
#
# 3. Obviously this solution is not designed in an OOP fashion, and is quite hard to wrap your head around.
# 4. implementing or statements is simply an issue of changing intersection to concatenation, but doing so would add duplicate code,
# so the need for refactoring further is clear
#

require 'set'
require 'json'

puts "Pre-processing...."

file = File.read('search_engine_input.json')
data = JSON.parse(file)

name_words = Set.new
data.each { |prod| name_words.merge(prod["name"].downcase.split) }
reverse_index = Hash.new {|hash, key| hash[key] = [] }

name_words.each do |word|
  data.each { |prod| reverse_index[word].push(prod["id"]) if prod["name"].downcase.include?(word) }
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
  result.each {|prod| puts data[prod].to_s }
else
  if reverse_index[input]
    puts "we found #{reverse_index[input].length} matching products"
    reverse_index[input].each {|prod| puts data[prod].to_s }
  else
    puts "No matches"
  end
end
