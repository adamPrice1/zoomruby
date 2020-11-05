module Reproduction

  def reproduce
    puts "finding a mate..."
    sleep(0.4)
    puts "doing the deed..."
    sleep(0.2)
    puts "congratulations its a #{rand(1) == 0 ? "boy" : "girl"}"
  end

  def raise_offspring
    "i want to sleep"
  end

end


module Evolution

  def start_to_use_tools
    "ooh a sharp rock \nuseful!"

  end

  def get_to_the_ruby_stage
    "woah meta"
  end

end


module BetterFood

  def eat_nicer_food
    "yum yum"
  end

  def make_recipe
    "two foods are better than one"
  end

end
