require 'minitest/autorun'
require_relative '../grade_book.rb'

class GradeBookTests < Minitest::Test

  def setup
    @grade_book = GradeBook.new
  end

  def test_new_grade_book_grades_is_empty
    actual = @grade_book.grades
    expected = Hash.new(0)
    assert_equal(expected, actual)
  end

  def test_new_grades_can_be_added
    @grade_book.add_grade("Adam", "100")
    assert(@grade_book.grades[:Adam] == 100.0)
  end

  def test_get_grade
    @grade_book.add_grade("Simon", "100")
    assert_equal(@grade_book.get_grade("Simon"), 100.0)
  end

  def test_letter_grades
    @grade_book.add_grade("Bill", "45")
    assert_equal(@grade_book.letter_grades[:Bill], 'F')
  end

  def test_that_add_grade_will_take_integer_input
    @grade_book.add_grade("Laura", 51)
    assert(@grade_book.grades[:Laura] == 51.0)
  end

  def test_whether_grade_book_can_handle_duplicate_names_without_overwriting
    @grade_book.add_grade("Wendel", 51)
    @grade_book.add_grade("Wendel", 75)
    assert(@grade_book.grades[:Wendel] != 75.0)
  end

  def test_adding_a_symbol
    @grade_book.add_grade(:Wendelyn, 51)
    assert(@grade_book.grades[:Wendelyn] == 51.0)
  end
end
