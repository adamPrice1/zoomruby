print "Enter a number: "
num = gets.chomp
while num.to_i.to_s != num
  print "Enter an actual number please: "
  num = gets.chomp
end

if num.to_i <= 0
  biggest = num.chars.map{|x| x.to_i}.sort.join
  puts "biggest combo = #{biggest.to_i * -1}"
else
  biggest = num.chars.map{|x| x.to_i}.sort.reverse.join
  puts "biggest combo = #{biggest}"
end
