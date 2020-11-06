class TreasureMap
  def initialize
    @coordinates = Hash.new(".")
  end

  def add_food_source(x,y)
    @coordinates[[x,y]] = "F"
  end

  def add_water_source(x,y)
    @coordinates[[x,y]] = "W"
  end

  def add_treasure(x,y)
    @coordinates[[x,y]] = "X"
  end

  def to_s
    return "there is nothing on this map to print" if @coordinates.empty?
    output = ""
    min_x, max_x = x_bounds
    min_y, max_y = y_bounds
    (min_y..max_y).each do |y|
      (min_x..max_x).each do |x|
        output += @coordinates[[x,y]]
      end
      output += "\n"
    end
    output
  end

  private

  def x_bounds
    bounds = @coordinates.keys.sort {|a, b| a[0] <=> b[0]}
    [bounds.first[0] - 1, bounds.last[0] + 1]
  end

  def y_bounds
    bounds = @coordinates.keys.sort {|a, b| a[1] <=> b[1]}
    [bounds.first[1] - 1, bounds.last[1] + 1]
  end

end


map = TreasureMap.new

map.add_food_source(0,0)
map.add_food_source(10,10)
map.add_food_source(-10,10)
map.add_water_source(-5,6)
map.add_treasure(-2,8)
puts map

puts TreasureMap.new
