$: << File.join(File.dirname(__FILE__), "/app/models")
$: << File.join(File.dirname(__FILE__), "/app/views")
$: << File.join(File.dirname(__FILE__), "/app/controllers")
$: << File.join(File.dirname(__FILE__), "/app/db")

# Delete the database for now, for testing purposes.
File.delete "db/test.db" if File.exists? "db/test.db"

require 'data_mapper'

DataMapper::Logger.new $stdout, :debug
DataMapper.setup :default, "sqlite3://#{Dir.pwd}/db/test.db"

require 'course'
require 'semester'
require 'student'

DataMapper.auto_upgrade!
DataMapper.finalize

kevin     = Student.create(:name => "Kevin Smith")
semester1 = Semester.create(:season => "Fall", :year => "2012", :school => "Baylor")
course1   = Course.create(:name => "Data Structures", :hours => 3)
semester1.courses << course1
kevin.semesters << semester1

kevin.save