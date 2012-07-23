class Course
  include DataMapper::Resource

  property :id,           Serial
  property :name,         String
  property :hours,        Integer, :default => 3
  property :grade_points, Decimal, :default => 4.0
  property :counts,       Boolean, :default => true

  belongs_to :semester

  def quality_points
    grade_points * hours
  end
end