class Creature

  attr_accessor :name

  @hunger = 0
  @thirst = 0
  @energy = 100
  def initialize(name)
    @name = name
  end

  def eat(food)
    puts "yarghblarghskhk #{food}"
    @hunger = 0
    @energy -= 1
  end

  def sleep
    puts "zzzZZZZzzzZZZZ"
    @hunger += 2
    @thirst += 3
    @energy = 100
  end

  def drink
    puts "shlurp"
    @thirst = 0
    @energy -= 1
  end

  def is_hungry?
    @hunger > 5
  end

  def is_thirsty?
    @thirst > 5
  end

  def is_tired?
    @energy < 50
  end

  def summary
    """
    hunger: #{self.hunger}
    thirst: #{self.thirst}
    energy: #{self.energy}
    """
  end

end

class Whippo < Creature

  def eat(food)
    puts "MooooOOOOOooooo #{food}"
    @hunger = 0
    @energy -= 1
  end

end

class Zhiraffe < Creature
  def eat(food)
    puts "chomp chomp #{food}"
    @hunger = 0
    @energy -= 1
  end
end

class Whamaconda < Creature
  def drink
    puts "hissssssssss"
    @thirst = 0
    @energy -= 1
  end
end

class Cheopard < Creature

  def drink
    puts "purrrrrrrrr"
    @thirst = 0
    @energy -= 1
  end

end

class Shelephant < Creature
  def sleep
    puts "trumpet noises"
    @hunger += 2
    @thirst += 3
    @energy = 100
  end
end

class Spaceship

  attr_accessor :passengers

  def initialize(name, fuel, passengers = [])
    @name = name
    @fuel = fuel
    @passengers = passengers
  end

  def blast_off
    puts "Ready for takeoff"
    while @fuel > 0
      puts "fuel level at: #{@fuel} "
      sleep(0.2)
      @fuel -= 5
    end

    puts "We've reached Kepler-1649c!"
  end

  def board_passenger(passenger)
    @passengers.push(passenger)
    puts "#{passenger.name} has boarded the #{@name}"
  end

  def disembark_passenger(passenger)
    puts "#{passenger.name} has left the #{@name}"
    @passengers.delete(passenger)
    passenger
  end

  def empty_ship
    @passengers = []
  end
end

class Planet

  attr_accessor :creatures

  def initialize(name, number_moons, dist_from_sun, atmosphere_gases, creatures=[])
    @name = name
    @number_moons = number_moons
    @dist_from_sun = dist_from_sun
    @atmosphere_gases = atmosphere_gases
    @creatures = creatures
  end

  def advance_time
    puts "Advancing Time..."
    @creatures.each {|c| puts "There are now #{rand(10000)} #{c.name}'s'"}
  end
end

whippo = Whippo.new("Whippo")
zhiraffe = Zhiraffe.new("Zhiraffe")
whamaconda = Whamaconda.new("Whamaconda")
cheopard = Cheopard.new("Cheopard")
shelephant = Shelephant.new("Ted")

millenium_pidgeon = Spaceship.new("Millenium Pigeon", 100)

millenium_pidgeon.board_passenger(whippo)
millenium_pidgeon.board_passenger(zhiraffe)
millenium_pidgeon.board_passenger(whamaconda)
millenium_pidgeon.board_passenger(cheopard)
millenium_pidgeon.board_passenger(shelephant)

millenium_pidgeon.blast_off

kepler = Planet.new("Kepler-1649c", 3, 300000, ["oxygen","nitrogen"])

millenium_pidgeon.passengers.each do |passenger|
  kepler.creatures.push(millenium_pidgeon.disembark_passenger(passenger))
end

puts kepler.creatures

kepler.advance_time
