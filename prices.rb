# def total(prices)
#   amount = 0
#   index = 0
#   while index < prices.length
#     amount += prices[index]
#     index += 1
#   end
#   amount
# end
#
# prices = [3.99, 25.00, 8.99]
#
# puts format("%.2f", total(prices))
#
# def refund(prices)
#   amount = 0
#   index = 0
#   while index < prices.length
#     amount -= prices[index]
#     index += 1
#   end
#   amount
# end
#
# puts format("%.2f", refund(prices))
#
# def show_discounts(prices)
#   index = 0
#   while index < prices.length
#     amount_off = prices[index] / 3.0
#     puts format("Your Discount: %.2f", amount_off)
#     index += 1
#   end
# end
#
# show_discounts(prices)

#
# def do_something_with_every_item(array, operation)
#   if operation == "total" || operation == "refund"
#     amount = 0
#   end
#   index = 0
#
#   while index < array.length
#     if operation == "total"
#       amount += array[index]
#     elsif operation == "refund"
#       amount -= array[index]
#     elsif operation == "show discounts"
#       amount_off = array[index] / 3.0
#       puts format("Your Discount: %.2f", amount_off)
#     end
#     index += 1
#   end
#
#   if operation == "total" || operation == "refund"
#     return amount
#   end
# end

def total(prices)
  amount = 0
  prices.each {|p| amount += p}
  amount
end

prices = [3.99, 25.00, 8.99]

puts format("%.2f", total(prices))

def refund(prices)
  amount = 0
  prices.each {|p| amount -= p}
  amount
end

puts format("%.2f", refund(prices))

def show_discounts(prices)
  prices.each do |price|
    amount_off = price / 3.0
    puts format("Your discount: $%.2f", amount_off)
  end
end

show_discounts(prices)
