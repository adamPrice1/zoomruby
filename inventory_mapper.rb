class InventoryMapper

  def initialize
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def count_products(parts_string)
    output = Hash.new(0)
    @products.each do |product|
      while is_buildable(product, parts_string)
        output[product.name] += 1
        parts_string = remove_one(parts_string, product)
      end
    end
    output
    end

  private

  def remove_one(parts_string, product)
    total_parts = parts_string.chars
    product_parts = product.parts_array
    product_parts.each do |part|
      index = total_parts.index(part)
      total_parts.delete_at(index) unless index.nil?
    end
    total_parts.join
  end

  def is_buildable(product, parts_string)
    is_buildable = true
    product.parts.keys.each {|part| is_buildable = false if product.parts_array.count(part) > parts_string.chars.count(part)}
    is_buildable
  end

end

class Product

  def initialize(name, parts)
    @parts = parts
    @name = name
  end

  def parts
    @parts
  end

  def name
    @name
  end

  def parts_array
    output = []
    @parts.each {|part, qty| (1..qty).each {output.push(part)}}
    output
  end
end


shelf = Product.new("shelf", {"a" => 1})
stool = Product.new("stool", {"b" => 1, "c" => 3})
table = Product.new("table", {"d" => 1, "e" => 4})

inventory = InventoryMapper.new
inventory.add_product(shelf)
inventory.add_product(stool)
inventory.add_product(table)

puts inventory.count_products("abccc")
puts inventory.count_products("beceadee")
puts inventory.count_products("eebeedebaceeceedeceacee")
puts inventory.count_products("zabc")
puts inventory.count_products("deeedeee")
