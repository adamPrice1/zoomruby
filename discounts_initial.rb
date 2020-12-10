# [ ['grapes', 1], ['apples', 0], ['peaches', 1] ] # output => 12
#  [ ['grapes', 1], ['apples', 1], ['peaches', 1] ] # output => 15
#  [ ['grapes', 2], ['apples', 2], ['peaches', 1] ] # output => 16.8
#  [ ['grapes', 3], ['apples', 5], ['peaches', 2] ] # output => 36
#  [ ['peaches', 7], ['grapes', 7], ['apples', 7] ] # output => 85.8


# Buy one bag of grapes and get another bag of grapes for free ("Two for the price of one")
# Buy at least two apples and get a 20% discount on apples

# rule 1: half the price of all grapes if coun
# rule 2: if apples_count > 1 then apples = apples * 0.8
GRAPE_PRICE = 5
APPLE_PRICE = 3
PEACH_PRICE = 7

input = [
[ ['grapes', 1], ['apples', 0], ['peaches', 1] ],
[ ['grapes', 1], ['apples', 1], ['peaches', 1] ], # output => 15
 [ ['grapes', 2], ['apples', 2], ['peaches', 1] ], # output => 16.8
 [ ['grapes', 3], ['apples', 5], ['peaches', 2] ], # output => 36
 [ ['peaches', 7], ['grapes', 7], ['apples', 7] ] # output => 85.8
]
def calculate_price(input)
  output = 0

  input.each do |fruit|
    case fruit[0]

      when 'grapes'
        if fruit[1] > 1
          output += (fruit[1] - (fruit[1] % 2)) * GRAPE_PRICE * 0.5
          output += (fruit[1] % 2) * GRAPE_PRICE 
        else
          output += GRAPE_PRICE * fruit[1]
        end
      when 'apples'
        if fruit[1] > 1
          output += APPLE_PRICE * fruit[1] * 0.8
        else
          output += APPLE_PRICE * fruit[1]
        end
      when 'peaches'
        output += PEACH_PRICE * fruit[1]
    end
  end
  output
end

input.each {|cart| puts calculate_price(cart)}
