require_relative 'toy'
require_relative 'Accessorizeable'

class Ball < Toy
  include Accessorizeable
  def initialize(name, color)
    super(name)
    @color = color
  end

  def to_s
    "A #{@color} Ball with #{accessories_to_s}"
  end

end
