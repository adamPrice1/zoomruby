class Domino
  attr_accessor :top, :bottom

  def initialize(top,bottom)
    @top = top
    @bottom = bottom
  end

  def to_s
    puts "***"
    puts "*#{self.top}*"
    puts "*-*"
    puts "*#{self.bottom}*"
    puts "***"
  end

  def self.get_set
    dominos = []
    (0..6).each do |i|
      (0..i).each do |j|
        dominos.push(Domino.new(j,i))
      end
    end
    dominos
  end
end

def swap_tops_and_bottoms(dominos)
  dominos.map do |dom|
    top = dom.top
    dom.top = dom.bottom
    dom.bottom = top
  end
  dominos
end

def find_dominos_with(num)
  Domino.get_set.find_all {|dom| [dom.top, dom.bottom].include?(num)}
end

dominos = Domino.get_set
dominos.each {|d| puts "#{d.top}, #{d.bottom}"}
puts "-----"
dominos = swap_tops_and_bottoms(dominos)

dominos.each {|d| puts "#{d.top}, #{d.bottom}"}

puts find_dominos_with(4)
