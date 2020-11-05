require_relative 'children'
require_relative 'modules'

small = SmallCreature.new("howard")
medium = MediumCreature.new("phil")
big = BigCreature.new("stephen")


puts small.eat_nicer_food
puts small.make_recipe
puts small.dig_burrow
small.receive_item("banana")
small.receive_item("strawberry")
small.give_item("strawberry")

puts medium.eat_leaves
puts medium.run_from_predator
puts medium.start_to_use_tools
puts medium.get_to_the_ruby_stage

puts big.reproduce
puts big.raise_offspring
puts big.eat
puts big.drink
puts big.move
puts big.speak
puts big.eat
big.carrying
big.do_something_to_carryables {|item| puts item}
