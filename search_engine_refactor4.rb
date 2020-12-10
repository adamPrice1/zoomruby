# Things that are wrong here:
# 4. implementing or statements is simply an issue of changing intersection to concatenation, but doing so would add duplicate code,
# so the need for refactoring further is clear
#

require 'set'
require 'json'

class SearchEngine

  def initialize(file)
    @reverse_index = nil
    @name_words = Set.new
    @file = file
    parse_file
  end

  def search(input)
    result = []
    if input.split.length > 1
      input.split.each do |word|
        if result.empty?
          result = @reverse_index[word]
        else
          result = result.intersection(@reverse_index[word])
        end
      end
    else
      result = @reverse_index[input]
    end
    puts "we found #{result.length} matching products"
    result.each {|prod| puts @data[prod].to_s }
  end

  private

  def parse_file
    @data = JSON.parse(@file)
    @data.each { |prod| @name_words.merge(prod["name"].downcase.split) }
    @reverse_index = Hash.new {|hash, key| hash[key] = [] }

    @name_words.each do |word|
      @data.each { |prod| @reverse_index[word].push(prod["id"]) if prod["name"].downcase.include?(word) }
    end
    puts "Data parsed!"
  end

end

file = File.read('search_engine_input.json')
searcher = SearchEngine.new(file)

print "search: "
searcher.search(gets.chomp.downcase)
