class Textogram

  def initialize(string:,  case_sensitive: false, special_chars: false, include_space: false)
    @string = string
    if !include_space then @string.gsub!(/\s+/, '') end
    if case_sensitive
       @chars = string.chars.uniq
    else
      @chars = string.downcase.chars.uniq
      @string.downcase!
    end

    @textogram = {}
    @chars.each do |char|
      @textogram[char] = @string.chars.count(char)
    end
  end

  def to_s
    @textogram.keys.sort.each {|key| puts "#{key}: #{"*" * @textogram[key]}"}
  end

end


puts Textogram.new(string: "aaaaAAAAAAAAaaaaaAAAABBBBBBBbbbbCCCC")

puts Textogram.new(string: "aaaaAAAAAAAAaaaaaAAAABBBBBBBbbbbCCCC", case_sensitive:true)

puts Textogram.new(string: "aaaaA AAAA AAAaaaaaA AAABBBBBBBbb bbCCCC", case_sensitive:true)

puts Textogram.new(string: "")
