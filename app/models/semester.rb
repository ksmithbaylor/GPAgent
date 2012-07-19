require 'sqlite3'
require 'course'

class Semester
  attr_accessor :courses, :season, :year, :school
  
  def initialize(season, year, school)
    @courses = []
    @season = season
    @year = year
    @school = school
  end
  
  def add_course(name, hours, grade = 4.0, counts = true)
    @courses << Course.new(name, hours, grade, counts)
  end
  
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