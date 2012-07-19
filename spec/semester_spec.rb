require_relative 'spec_helper'

describe Semester do
  before :each do
    @s = Semester.new("Fall", 2012, "Baylor")
  end

  it "should initialize correctly" do
    @s.season.should == "Fall"
    @s.year.should == 2012
    @s.school.should == "Baylor"
    @s.courses.should be_empty
  end

  it "should add a single course correctly" do
    @s.add_course("Tennis", 1)
    @s.courses.first.name.should == "Tennis"
    @s.courses.first.hours.should == 1
  end

  it "should add multiple courses correctly" do
    @s.add_course("Tennis", 1)
    @s.add_course("Tennis", 1)
    @s.add_course("Tennis", 1)
    @s.courses.each do |course|
      course.name.should == "Tennis"
      course.hours.should == 1
    end
  end

  it "should calculate GPA correctly" do
    # Fall 2011 grades and GPA
    @s.add_course("A Cappella",           1, 4.0)
    @s.add_course("Baylor Bronze",        1, 4.0)
    @s.add_course("Chamber Singers",      1, 4.0)
    @s.add_course("Anthropology",         3, 4.0)
    @s.add_course("Theatre Appreciation", 2, 4.0)
    @s.add_course("Computer Science",     4, 3.5)
    @s.add_course("Christian Heritage",   3, 3.0)
    @s.add_course("Political Science",    3, 2.5)
    @s.gpa.should == 3.472
  end

  it "should calculate blank GPA correctly" do
    # High school grades
    @s.add_course("AP Calculus AB",          3, 4.0, false)
    @s.add_course("AP Calculus BC",          3, 4.0, false)
    @s.add_course("AP Economics",            3, 4.0, false)
    @s.add_course("AP English",              3, 4.0, false)
    @s.add_course("AP Environmental",        3, 4.0, false)
    @s.add_course("AP Music Theory Aural",   1, 4.0, false)
    @s.add_course("AP Music Theory Written", 3, 4.0, false)
    @s.add_course("AP Physics C",            4, 4.0, false)
    @s.gpa.should == 0
  end
end