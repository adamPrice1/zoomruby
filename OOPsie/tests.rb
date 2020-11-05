require_relative 'children'
require_relative 'modules'
require_relative 'parent'
require 'minitest/autorun'

class CreatureTests < Minitest::Test

  def setup
    @small = SmallCreature.new("howard")
    @medium = MediumCreature.new("phil")
    @big = BigCreature.new("stephen")
  end

  def test_correct_superclass_is_set
    assert_equal(SmallCreature.superclass, Creature)
    assert_equal(MediumCreature.superclass, Creature)
    assert_equal(BigCreature.superclass, Creature)
  end

  def test_receive_method
    expected = @small.count("pineapple") + 1
    @small.receive_item("pineapple")
    actual = @small.count("pineapple")
    assert_equal(expected, actual)
  end

  def test_give_method
    @small.receive_item("pineapple")
    expected = @small.count("pineapple") - 1
    @small.give_item("pineapple")
    actual = @small.count("pineapple")
    assert_equal(expected, actual)
  end

  def test_speak_method
    assert_equal("Speaking...",@medium.speak)
  end

  def test_big_eat
      assert_equal(@big.eat, "chomp chomp")
  end

  def test_medium_run_from_predator
      assert_equal(@medium.run_from_predator, "ahhhhhhhhhhhhhh")
  end

  def test_evolution_tools
      assert_equal(@medium.start_to_use_tools, "ooh a sharp rock \nuseful!")
  end

  def test_evolution_ruby
      assert_equal(@medium.get_to_the_ruby_stage, "woah meta")
  end

  def test_eat_method_overwritten_for_big
    refute_equal(@big.move, @medium.move)
  end

  def test_prints_carrying
    assert_output(/\{"pineapple".*?"strawberry".*?"kiwi".*?"apple"/) {@big.carrying}
  end

  def test_extra_items_added_to_carryables
    refute_nil(@small.count("banana"))
  end

  def test_classes_instantiated_correctly
    assert_instance_of(BigCreature, @big)
    assert_instance_of(MediumCreature, @medium)
    assert_instance_of(SmallCreature, @small)
  end

end
