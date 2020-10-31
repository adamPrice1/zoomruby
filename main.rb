require_relative "box_jelly"
require_relative "cone_jelly"
require_relative "square_jelly"

box = BoxJelly.new("Boxy", 200, 12)
cone = ConeJelly.new("Coney", 100)
square = SquareJelly.new("Spongebob", 50)


box.swim
box.impersonate_plastic_bag

cone.swim
cone.swim_away_from_predator

square.scare_person
puts square.people_scared

jellies = [box,cone,square]

puts jellies.select {|jelly| jelly.venom_level >= 100 }

box.swim_faster

cone.swim_slower

square.sink_to_bottom
