require_relative 'gilded_rose_refactor'
require 'minitest/autorun'

class GildedRoseTests < Minitest::Test
  def setup
    @gilded = GildedRose.new([
      RegularItem.new("Peaches",10,10)
    ])
    @gilded_brie = GildedRose.new([
      AgedBrie.new("Big Block",10,10)
    ])
    @gilded_backstage = GildedRose.new([
      BackstagePass.new("Big Pass",11,11)
    ])
    @gilded_sulfuras = GildedRose.new([
      Sulfuras.new("Sulfuras",10,80)
    ])
    @gilded_conjured = GildedRose.new([
      Conjured.new("Magic Staff",10,10)
    ])
  end

  def test_regular_item_initialises_correctly
    assert(@gilded.items[0].name == "Peaches")
  end

  def test_regular_item_decreases_quality_and_sell_in
    @gilded.update_quality
    assert_equal(@gilded.items[0].sell_in, 9)
    assert_equal(@gilded.items[0].quality, 9)
  end

  def test_regular_item_quality_decreases_by_2_if_sell_in_0
    @gilded.items[0].sell_in = 0
    @gilded.update_quality
    assert_equal(@gilded.items[0].quality, 8)
  end

  def test_regular_item_quality_never_negative
    @gilded.items[0].quality = 0
    @gilded.update_quality
    assert_equal(@gilded.items[0].quality, 0)
  end

  def test_aged_brie_quality_increases
    expected = @gilded_brie.items[0].quality + 1
    @gilded_brie.update_quality
    assert_equal(expected, @gilded_brie.items[0].quality)
  end

  def test_aged_brie_doesnt_go_beyond_50
    @gilded_brie.items[0].quality = 50
    @gilded_brie.update_quality
    assert_equal(@gilded_brie.items[0].quality, 50)
  end

  def test_backstage_pass_updates_quality_and_sell_in_when_sell_in_over_10
    expected_quality = @gilded_backstage.items[0].quality + 1
    expected_sell_in = @gilded_backstage.items[0].sell_in - 1
    @gilded_backstage.update_quality
    assert_equal(expected_quality, @gilded_backstage.items[0].quality)
    assert_equal(expected_sell_in, @gilded_backstage.items[0].sell_in)
  end

  def test_backstage_pass_updates_quality_and_sell_in_when_sell_in_under_10
    @gilded_backstage.items[0].quality = 10
    @gilded_backstage.items[0].sell_in = 10
    expected_quality = 12
    expected_sell_in = 9
    @gilded_backstage.update_quality
    assert_equal(expected_quality, @gilded_backstage.items[0].quality)
    assert_equal(expected_sell_in, @gilded_backstage.items[0].sell_in)
  end

  def test_backstage_pass_updates_quality_and_sell_in_when_sell_in_under_5
    @gilded_backstage.items[0].quality = 10
    @gilded_backstage.items[0].sell_in = 5
    expected_quality = 13
    expected_sell_in = 4
    @gilded_backstage.update_quality
    assert_equal(expected_quality, @gilded_backstage.items[0].quality)
    assert_equal(expected_sell_in, @gilded_backstage.items[0].sell_in)
  end

  def test_sulfuras_quality_always_80
    expected = @gilded_sulfuras.items[0].quality
    @gilded_sulfuras.update_quality
    assert_equal(expected, @gilded_sulfuras.items[0].quality)
  end

  def test_sulfuras_no_decrement_sell_in
    expected = @gilded_sulfuras.items[0].sell_in
    @gilded_sulfuras.update_quality
    assert_equal(expected, @gilded_sulfuras.items[0].sell_in)
  end

  def test_conjured_item_decreases_quality_and_sell_in_correctly
    @gilded_conjured.update_quality
    assert_equal(9, @gilded_conjured.items[0].sell_in)
    assert_equal(8, @gilded_conjured.items[0].quality)
  end
end
