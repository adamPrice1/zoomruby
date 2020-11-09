require_relative 'clothing'

class TShirt < Clothing

  def to_s
    "a #{@name}, T-shirt, in size #{@size}"
  end

end
