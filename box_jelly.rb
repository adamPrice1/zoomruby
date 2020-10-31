require_relative "Jelly"

class BoxJelly < Jelly

  attr_accessor :injury_count

  def initialize(name, venom_level, injury_count)
    super(name, venom_level)
    @injury_count = injury_count
  end

  def impersonate_plastic_bag
    puts "rustle rustle rustle"
  end

end
