class Creature

  attr_accessor :name, :health, :age

  def self.carryable_items
    {
      "pineapple" => 0,
      "strawberry" => 0,
      "kiwi" => 0
    }
  end


  def initialize(name)
    @name = name
    @items_carrying = Creature.carryable_items
  end

  def move
    "Moving..."
  end

  def speak
    "Speaking..."
  end

  def give_item(item)
    if  @items_carrying[item] > 0
      @items_carrying[item] -= 1
      return item
    else
      return false
    end
  end

  def receive_item(item)
    @items_carrying[item] += 1 if @items_carrying.keys.include?(item)
  end

  def do_something_to_carryables
    @items_carrying.each { |item| yield(item) }
  end

  def carrying
    puts @items_carrying.to_s
  end

  def count(item)
    return @items_carrying[item] if @items_carrying.keys.include?(item)
    false
  end
end
