class Vehicle

  attr_accessor :odometer
  attr_accessor :gas_used

  def mileage
    @odometer / @gas_used
  end

  def accelerate
    puts "Floor it!"
  end

  def sound_horn
    puts "Beep! Beep!"
  end

  def steer
    puts "Turn two front wheels"
  end
end

class Car < Vehicle
end

class Truck < Vehicle
end

class Motorcylce < Vehicle
end

truck = Truck.new
truck.accelerate
truck.steer

car = Car.new
car.odometer = 11432
car.gas_used = 366

puts "Lifetime Mileage"
puts car.mileage
