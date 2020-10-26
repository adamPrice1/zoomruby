puts "how much change is owed?"

input = gets.to_f

until input > 0 && input.to_s.to_f == input
  puts "invalid input"
  input = gets.to_f
end

amount_left = input
coins = []

while amount_left != 0
  if (amount_left / 2.00).floor > 0
    (amount_left / 2.00).floor.times do
      coins.push("toonie")
      amount_left -= 2.00
    end
  elsif (amount_left / 1.00).floor > 0
    (amount_left / 1.00).floor.times do
      coins.push("loonie")
      amount_left -= 1.00
    end
  elsif (amount_left / 0.25).floor > 0
    (amount_left / 0.25).floor.times do
      coins.push("quarter")
      amount_left -= 0.25
    end
  elsif (amount_left / 0.1).floor > 0
    (amount_left / 0.1).floor.times do
      coins.push("dime")
      amount_left -= 0.1
    end
  elsif (amount_left / 0.05).floor > 0
    (amount_left / 0.05).floor.times do
      coins.push("nickel")
      amount_left -= 0.05
    end
  elsif amount_left > 0.02
      coins.push("0.05$")
      amount_left = 0
  else
      amount_left = 0
  end
end

coins.uniq.each do |coin|

  if coins.count(coin) > 1
    puts "#{coins.count(coin)} #{coin}s"
  else
    puts "1 #{coin}"
  end
end
