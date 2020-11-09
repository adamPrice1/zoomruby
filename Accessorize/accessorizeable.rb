module Accessorizeable

  def add_accessory(accessory)
    @accessories = [] unless defined?(@accessories)
    @accessories << accessory
  end

  def remove_accessory(accessory)
    @accessories.delete(accessory)
  end

  def accessories_to_s
    @accessories.join(", ")
  end

  def get_accessories
    return false unless defined?(@accessories)
    @accessories
  end
end
