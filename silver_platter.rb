class Fruit

  def to_s
    "A lovely piece of fruit"
  end

end

class Apple < Fruit

  def to_s
    "A lovely apple"
  end

  def eat
    puts "yum"
  end

end

class Banana < Fruit
  def to_s
    "A lovely banana"
  end

  def eat
    puts "yummy banana"
  end
end

class Cheese
  def to_s
    "A nice bit of cheese"
  end

  def eat
    puts "lovely cheese gromit"
  end
end

class Sausage
  def to_s
    "A nice sausage"
  end

  def eat
    puts "lovely hot dog"
  end
end

silver_platter = [
  Fruit.new,
  Apple.new,
  Banana.new,
  Cheese.new,
  Sausage.new
]

silver_platter.each {|food| puts food ; food.eat if food.respond_to?(:eat)}
