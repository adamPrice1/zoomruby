require 'minitest/autorun'

class StudentBody
  include Enumerable
  def initialize
    @student_body = Hash.new {|hash, key| hash[key] = [] }
  end

  def add_student(subject, student)
    @student_body[subject].push(student)
  end

  def each
    @student_body.keys.each do |subject|
      @student_body[subject].each { |student| yield(student) }
    end
  end
end



class TestStudentBody < Minitest::Test

  def setup
    @school1 = StudentBody.new
    @school1.add_student("geography", "adam price")
    @school1.add_student("history", "bonnie")
    @school1.add_student("politics", "clyde")
  end

  def test_add_student
    @school1.add_student("maths", "albert")
    students = []
    @school1.each {|student| students << student}
    assert(students.include?("albert"))
  end

  def test_each_method_empty_class
    school = StudentBody.new
    expected = ""
    actual = ""
    school.each {|student| actual += student}
    assert_equal(expected, actual)
  end

  def test_each_method_non_empty
    school = StudentBody.new
    expected = "henry"
    school.add_student("biology", "henry")
    actual = ""
    school.each {|student| actual += student}
    assert_equal(expected, actual)
  end

  def test_multiple_students_per_subject
    school = StudentBody.new
    expected = "henryhenrietta"
    school.add_student("biology", "henry")
    school.add_student("biology", "henrietta")
    actual = ""
    school.each {|student| actual += student}
    assert_equal(expected, actual)
  end

end
