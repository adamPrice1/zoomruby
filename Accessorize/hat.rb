require_relative 'clothing'

class Hat < Clothing

  def to_s
    "a #{@name}, Hat, in size #{@size}"
  end

end
