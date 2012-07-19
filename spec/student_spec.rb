require_relative 'spec_helper'

describe Student do
  before :each do
    @s = Student.new("Kevin Smith")
  end

  it "should initialize correctly" do
    @s.name.should == "Kevin Smith"
    @s.semesters.should be_empty
  end

  it "should add a single semester correctly" do
    @s.add_semester("Spring", 2011, "Baylor")
    @s.semesters.first.season.should == "Spring"
    @s.semesters.first.year.should == 2011
    @s.semesters.first.school.should == "Baylor"
  end

  it "should add multiple semesters correctly" do
    @s.add_semester("Fall", 2010, "Baylor")
    @s.add_semester("Spring", 2011, "Baylor")
    @s.add_semester("Summer", 2011, "Collin College")
    @s.semesters.length.should == 3
    @s.semesters[2].season.should == "Summer"
  end

  it "should calculate gpa correctly over many semesters" do
    @s.add_semester("Spring", 2010, "Newman Smith")
      @s.semesters.last.add_course("AP Calculus AB",          3, 4.0, false)
      @s.semesters.last.add_course("AP Calculus BC",          3, 4.0, false)
      @s.semesters.last.add_course("AP Economics",            3, 4.0, false)
      @s.semesters.last.add_course("AP English",              3, 4.0, false)
      @s.semesters.last.add_course("AP Environmental",        3, 4.0, false)
      @s.semesters.last.add_course("AP Music Theory Aural",   1, 4.0, false)
      @s.semesters.last.add_course("AP Music Theory Written", 3, 4.0, false)
      @s.semesters.last.add_course("AP Physics C",            4, 4.0, false)
    @s.semesters.last.gpa.should == 0
    @s.add_semester("Fall", 2010, "Baylor")
      @s.semesters.last.add_course("Campus Orchestra",     1, 4.0)
      @s.semesters.last.add_course("Cello Lessons",        1, 4.0)
      @s.semesters.last.add_course("Chamber Singers",      1, 4.0)
      @s.semesters.last.add_course("Concert Choir",        1, 4.0)
      @s.semesters.last.add_course("Diction I",            1, 4.0)
      @s.semesters.last.add_course("Music Theory II",      3, 4.0)
      @s.semesters.last.add_course("Musicianship I",       1, 4.0)
      @s.semesters.last.add_course("Voice Lesson",         2, 4.0)
      @s.semesters.last.add_course("Christian Scriptures", 3, 3.5)
      @s.semesters.last.add_course("Intermediate Spanish", 3, 2.0)
    @s.semesters.last.gpa.should == 3.559
    @s.add_semester("Spring", 2011, "Baylor")
      @s.semesters.last.add_course("Campus Orchestra", 1, 4.0)
      @s.semesters.last.add_course("Chamber Singers",  1, 4.0)
      @s.semesters.last.add_course("Concert Choir",    1, 4.0)
      @s.semesters.last.add_course("Diction II",       1, 4.0)
      @s.semesters.last.add_course("Leadership",       1, 4.0)
      @s.semesters.last.add_course("Music Theory III", 3, 4.0)
      @s.semesters.last.add_course("Musicianship II",  1, 4.0)
      @s.semesters.last.add_course("Piano II",         1, 4.0)
      @s.semesters.last.add_course("Voice Lessons",    2, 4.0)
      @s.semesters.last.add_course("World History",    3, 3.0)
    @s.semesters.last.gpa.should == 3.800
    @s.add_semester("Summer", 2011, "Collin College")
      @s.semesters.last.add_course("Art Appreciation", 3, 4.0, false)
      @s.semesters.last.add_course("US History",       3, 4.0, false)
    @s.semesters.last.gpa.should == 0
    @s.add_semester("Fall", 2011, "Baylor")
      @s.semesters.last.add_course("A Cappella",           1, 4.0)
      @s.semesters.last.add_course("Baylor Bronze",        1, 4.0)
      @s.semesters.last.add_course("Chamber Singers",      1, 4.0)
      @s.semesters.last.add_course("Anthropology",         3, 4.0)
      @s.semesters.last.add_course("Theatre Appreciation", 2, 4.0)
      @s.semesters.last.add_course("Computer Science I",   4, 3.5)
      @s.semesters.last.add_course("Christian Heritage",   3, 3.0)
      @s.semesters.last.add_course("Political Science",    3, 2.5)
    @s.semesters.last.gpa.should == 3.472
    @s.add_semester("Spring", 2012, "Baylor")
      @s.semesters.last.add_course("A Cappella",          1, 4.0)
      @s.semesters.last.add_course("Biology",             4, 4.0)
      @s.semesters.last.add_course("Chamber Singers",     1, 4.0)
      @s.semesters.last.add_course("Computer Science II", 4, 4.0)
      @s.semesters.last.add_course("Discrete Structures", 3, 4.0)
      @s.semesters.last.add_course("Logic",               3, 4.0)
    @s.semesters.last.gpa.should == 4.0
    @s.add_semester("Fall", 2012, "Baylor")
      @s.semesters.last.add_course("A Cappella",         1, 4.0)
      @s.semesters.last.add_course("Chamber Singers",    1, 4.0)
      @s.semesters.last.add_course("Computer Systems",   3, 4.0)
      @s.semesters.last.add_course("Data Structures",    3, 4.0)
      @s.semesters.last.add_course("Music Appreciation", 2, 4.0)
      @s.semesters.last.add_course("Technical Writing",  3, 4.0)
      @s.semesters.last.add_course("Beginning Tennis",  1, 4.0)
    @s.semesters.last.gpa.should == 4.0
    @s.gpa.should == 3.750
  end
end