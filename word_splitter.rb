class WordSplitter
  include Enumerable
  attr_accessor :string

   def each
     string.split(" ").each do |word|
       yield word
     end
   end
end

splitter = WordSplitter.new
splitter.string = "one two three four"

splitter.each {|w| puts w}

p splitter.find_all {|w| w.include?("t")}
