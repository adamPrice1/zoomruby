# [ ['grapes', 1], ['apples', 0], ['peaches', 1] ] # output => 12
#  [ ['grapes', 1], ['apples', 1], ['peaches', 1] ] # output => 15
#  [ ['grapes', 2], ['apples', 2], ['peaches', 1] ] # output => 16.8
#  [ ['grapes', 3], ['apples', 5], ['peaches', 2] ] # output => 36
#  [ ['peaches', 7], ['grapes', 7], ['apples', 7] ] # output => 85.8


# Buy one bag of grapes and get another bag of grapes for free ("Two for the price of one")
# Buy at least two apples and get a 20% discount on apples

# rule 1: half the price of all grapes if coun
# rule 2: if apples_count > 1 then apples = apples * 0.8

# https://mixandgo.com/learn/how-to-avoid-the-ruby-class-variable-problem
#got here with 28 mins left!


#finished with 11mins left

class Fruit
  @price = 0
  def self.calculate_price(qty)
    @price * qty
  end
end

class Grape < Fruit
  @price = 5
  def self.calculate_price(qty)
    output = 0
    if qty > 1
      output += (qty - (qty % 2)) * @price * 0.5
      output += (qty % 2) * @price
    else
      output += @price * qty
    end
    output
  end
end

class Apple < Fruit
  @price = 3
  def self.calculate_price(qty)
    output = 0
    if qty > 1
      output += @price * qty * 0.8
    else
      output += @price * qty
    end
    output
  end
end

class Peach < Fruit
  @price = 7
end

class ShoppingBasket

  def initialize(products = Hash.new)
    @products = products
  end

  def calculate_total
    output = 0
    @products.each {|prod, qty| output += prod.calculate_price(qty)}
    output
  end

end


puts ShoppingBasket.new({
  Grape => 1,
  Apple => ,
  Peach => 0
  }).calculate_total
