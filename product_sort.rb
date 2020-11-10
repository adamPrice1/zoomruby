
PRODUCTS = ["Selfie Stick,98,29",
"iPhone Case,90,15",
"Fire TV Stick,48,49",
"Wyze Cam,48,25",
"Water Filter,56,49",
"Blue Light Blocking Glasses,90,16",
"Ice Maker,47,119",
"Video Doorbell,47,199",
"AA Batteries,64,12",
"Disinfecting Wipes,37,12",
"Baseball Cards,73,16",
"Winter Gloves,32,112",
"Microphone,44,22",
"Pet Kennel,5,24",
"Jenga Classic Game,100,7",
"Ink Cartridges,88,45",
"Instant Pot,98,59",
"Hoze Nozzle,74,26",
"Gift Card,45,25",
"Keyboard,82,19"]


# Not sure if this way of first declaring a struct is preferrable, it's certainly more readable
# but the result is achievable quite easily without it. (commented out below)

product =  Struct.new(:name, :popularity, :price)
products = PRODUCTS.map  do |prod|
  name, popularity, price = prod.split(",")
  product.new(name, popularity.to_i, price.to_i)
end

products.sort_by! {|prod| [-prod.popularity, prod.price]}

p products

# PRODUCTS.sort_by! do |prod|
#   product = prod.split(",")
#   [-product[1].to_i, product[2].to_i]
# end
#
# p PRODUCTS
