class Jelly
  include Comparable
  attr_accessor :is_peaceful, :location, :venom_level, :name

  JELLY_LOCATIONS = ["Australia","France","Ireland","Maldives","Cuba"]

  def initialize(name, venom_level)
    @name = name
    @venom_level = venom_level
  end

  def <=>(other)
    self.venom_level <=> other.venom_level
  end

  def anger
    puts "you have angered the #{self.name}"
    self.is_peaceful = false
  end

  def pacify
    puts "you have calmed the #{self.name}"
    self.is_peaceful = true
  end

  def swim
    if self.is_peaceful
      3.times do
        puts "swims peacefully"
        sleep(0.4)
      end
    else
      3.times do
        puts "swims angrily"
        sleep(0.2)
      end
    end
  end

  def report_sighting(location)
    self.location = location if JELLY_LOCATIONS.include?(location)
  end

  def to_s
    puts "The Majestic #{self.class}, #{self.name}"
  end
end
