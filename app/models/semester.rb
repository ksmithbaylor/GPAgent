require 'course'

class Semester
  include DataMapper::Resource

  property :id,     Serial
  property :season, String
  property :year,   Integer
  property :school, String

  has n, :courses
  belongs_to :student
  
  def gpa
    attempted_hours = 0
    grade_points    = 0
    @courses.each do |course|
      attempted_hours += course.hours if course.counts
      grade_points    += course.quality_points if course.counts
    end
    (attempted_hours > 0) ? ((grade_points / attempted_hours).round 3) : 0
  end

  def total_hours
    total = 0
    @courses.each do |course|
      total += course.hours
    end
    total
  end

  def total_grade_points
    total = 0
    @courses.each do |course|
      total += course.grade_points
    end
    total
  end
end