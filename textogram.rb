class Textogram

  def initialize(string:,  case_sensitive: false, special_chars: false, include_space: false, word_mode: false)
    @string = string
    @case_sensitive = case_sensitive
    @special_chars = special_chars
    @include_space = include_space
    @word_mode = word_mode
    @textogram = {}
    @values = values
    textogram
  end

  def to_s
    @textogram.keys.sort.each {|key| puts "#{key}: #{ "*" * @textogram[key] }"}
  end

  private

  def values
    if @word_mode
      @string.gsub!(/[^\w\s]/, '')
      return @string.split.uniq
    end
    unless @include_space
      @string.gsub!(/\S/, '')
    end
    unless @case_sensitive then @string.downcase! end
    @string.chars.uniq
  end

  def textogram
    @values.each {|val| @textogram[val] = @string.scan(/#{val}/).length}
  end
end


# puts Textogram.new(string: "aaaaAAAAAAAAaaaaaAAAABBBBBBBbbbbCCCC")
#
# puts Textogram.new(string: "aaaaAAAAAAAAaaaaaAAAABBBBBBBbbbbCCCC", case_sensitive:true)
#
# puts Textogram.new(string: "aaaaA AAAA AAAaaaaaA AAABBBBBBBbb bbCCCC", case_sensitive:true)
#
# puts Textogram.new(string: "")
#
# puts Textogram.new(string: "aaaaA AAAA AAAaaaaaA AAABBBBBBBbb bbCCCC", word_mode: true, case_sensitive: true)

File.open("ATaleOfTwoCities.txt", 'r') {|file| puts Textogram.new(string: file.read , word_mode: true)}
