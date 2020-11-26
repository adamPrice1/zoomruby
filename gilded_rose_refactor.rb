# All items have a SellIn value which denotes the number of days we have to sell the item
# All items have a Quality value which denotes how valuable the item is
# At the end of each day our system lowers both values for every item

# Once the sell by date has passed, Quality degrades twice as fast
# The Quality of an item is never negative
# "Aged Brie" actually increases in Quality the older it gets
# The Quality of an item is never more than 50
# "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
# "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches; Quality increases by 2 when there are
# 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
# "Conjured" items degrade in Quality twice as fast as normal items
# "Sulfuras" is a legendary item and as such its Quality is 80 and it never alters.
class GildedRose

  attr_accessor :items

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.update_quality
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class RegularItem < Item
  def update_quality
    if @sell_in > 0
      @sell_in -= 1
      @quality -= 1 if @quality > 0
    else
      @quality -= 2 if @quality > 0
    end
  end

end

class AgedBrie < RegularItem
  def update_quality
    @sell_in -= 1 if @sell_in > 0
    @quality += 1 if @quality < 50
  end
end

class BackstagePass < RegularItem
  def update_quality
    if @sell_in <= 5 && @sell_in > 0
      @quality += 3
    elsif @sell_in <= 10 && @sell_in > 0
      @quality += 2
    elsif @sell_in > 10 && @quality < 50
      @quality += 1
    end
    @sell_in -= 1 if @sell_in > 0
  end
end

class Sulfuras < RegularItem
  def update_quality
    @quality = 80
  end
end

class Conjured < RegularItem
  def update_quality
    if @sell_in > 0
      @sell_in -= 1
      @quality -= 2
    else
      @quality -= 4
    end
  end
end
