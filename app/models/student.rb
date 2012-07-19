require 'sqlite3'
require 'semester'

class Student
  attr_accessor :semesters, :name
  
  def initialize(name = "Default Name")
    @semesters = []
    @name = name
  end
  
  def add_semester(season, year, school)
    @semesters << Semester.new(season, year, school)
  end
  
  def gpa
    attempted_hours = 0
    grade_points    = 0
    @semesters.each do |semester|
      semester.courses.each do |course|
        attempted_hours += course.hours if course.counts
        grade_points    += course.quality_points if course.counts
      end
    end
    (grade_points / attempted_hours).round 3
  end
end