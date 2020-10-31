require_relative "Jelly"

class ConeJelly < Jelly

  attr_accessor :fish_eaten

  def swim_away_from_predator
    puts "I am swimming away from a turtle"
  end

  def swim
    if self.is_peaceful
      3.times do
        puts "swims peacefully as a cone"
        sleep(0.4)
      end
    else
      3.times do
        puts "swims angrily as a cone"
        sleep(0.2)
      end
    end
  end

end
