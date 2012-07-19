require_relative 'spec_helper'

describe Course do
  it "should initialize correctly with no grade" do
    @c = Course.new("Biology", 4)
    @c.name.should == "Biology"
    @c.hours.should == 4
    @c.grade_points.should == 4.0
  end

  it "should initialize correctly with a grade" do
    @c = Course.new("Spanish", 3, 3.5)
    @c.grade_points.should == 3.5
  end

  it "should calculate quality points correctly" do
    @c = Course.new("English", 3, 3.5)
    @c.quality_points.should == 10.5
  end
end