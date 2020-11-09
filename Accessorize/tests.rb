require 'minitest/autorun'
require_relative 'ball'
require_relative 'hat'
require_relative 't-shirt'

class TestToysAndClothes < Minitest::Test

  def setup
    @ball = Ball.new("bouncy ball", "red")
    @tshirt = TShirt.new("v-neck", "large")
  end

  def test_accessorizeable
    ball = @ball
    ball.add_accessory("stickers")
    assert_equal("A red Ball with stickers", ball.to_s)
  end

  def test_add_accessory
    ball = @ball
    ball.add_accessory("paint")
    assert(ball.get_accessories.include?("paint"))
  end

  def test_remove_accessory
    ball = @ball
    ball.add_accessory("paint")
    ball.remove_accessory("paint")
    assert(ball.get_accessories.empty?)
  end

  def test_non_accessorize_to_s
    assert_equal("a v-neck, T-shirt, in size large", @tshirt.to_s)
  end



end
