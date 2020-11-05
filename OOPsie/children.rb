require_relative 'parent'
require_relative 'modules'
class BigCreature < Creature
  include Reproduction
  attr_accessor :weight

  def initialize(name)
    super
    @items_carrying.store("apple",0)
  end

  def eat
    "chomp chomp"
  end

  def drink
    "gulp gulp"
  end

  def move
    "lumbering..."
  end

end


class MediumCreature < Creature
  include Evolution
  attr_accessor :is_herbivore

  def initialize(name)
    super
    @items_carrying.store("blueberry",0)
    @is_herbivore = true
  end

  def eat_leaves
    "chew chew"
  end

  def run_from_predator
    "ahhhhhhhhhhhhhh"
  end

end


class SmallCreature < Creature
  include BetterFood
  attr_accessor :is_burrower

  def initialize(name)
    super
    @items_carrying.store("banana",0)
    @is_burrower = true
  end

  def dig_burrow
    "Dig dig dig"
  end

  def hide_from_predator
    "shhhhhh"
  end

end
