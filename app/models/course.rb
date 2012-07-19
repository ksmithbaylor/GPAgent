require 'sqlite3'

class Course
  attr_accessor :name, :hours, :grade_points, :counts
  def initialize(name, hours, grade = 4.0, counts = true)
    @name = name
    @hours = hours
    @grade_points = grade
    @counts = counts
  end

  def quality_points
    grade_points * hours
  end
end