def customized_list_of_multiples(multiples_of, size)
  multiples = []
  1.upto(multiples_of / 2) do |num|
    if multiples_of % num == 0  && multiples.length < size
      multiples.push(num)
    end
  end
  yield(multiples) if block_given?
  multiples
end

puts customized_list_of_multiples(12, 4)
puts "-------"
puts customized_list_of_multiples(12, 4) {|factors| factors.reverse!}
puts "-------"
puts customized_list_of_multiples(12, 4) {|factors| factors.map! {|factor| factor ** 2}}
