class Animal
  attr_reader :name, :age

  def name=(value)
    raise "Name can't be blank" if value == ""
    @name = value
  end

  def age=(value)
    raise "Age invalid" if value < 0
    @age = value
  end

  def talk
    puts "#{@name} says bark"
  end

  def move(destination)
    puts "#{@name} runs to #{destination}"
  end

  def report_age
    puts "#{name} is #{age}"
  end
end

class Dog < Animal
  def to_s
    "#{@name}, the dog, age #{@age}"
  end
end

class Bird < Animal
  def talk
    puts "#{@name} says chirp chirp"
  end
end

class Cat < Animal
  def talk
    puts "#{@name} says meow"
  end
end

class Armadillo < Animal
  def move(destination)
    puts "#{@name} unrolls"
    super
  end
end
