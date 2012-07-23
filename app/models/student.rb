require 'semester'

class Student
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :semesters
  
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