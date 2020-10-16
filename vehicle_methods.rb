def accelerate
  puts "Stepping on the gas"
  puts "Speeding up"
end

def sound_horn
  puts "Pressing the horn button"
  puts "Beep beep!"
end

def use_headlights(brightness = "high beam")
  puts "Turning on #{brightness} headlights"
  puts "Watch out for deer!"
end

def mileage(miles_driven, gas_used)
  if gas_used == 0 then return 0.0 end
  miles_driven / gas_used
end

trip_mileage = mileage(400,0)
puts trip_mileage


# sound_horn
# accelerate
# use_headlights
# use_headlights("low-beam")
