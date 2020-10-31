require_relative "Jelly"

class SquareJelly < Jelly

  attr_accessor :people_scared

  def initialize(name, venom_level)
    super(name, venom_level)
    self.people_scared = 0
  end

  def scare_person
    puts "I'll sting you!"
    self.people_scared += 1
  end
end
