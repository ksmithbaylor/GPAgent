$: << File.join(File.dirname(__FILE__), "/app/models")
$: << File.join(File.dirname(__FILE__), "/app/views")
$: << File.join(File.dirname(__FILE__), "/app/controllers")
$: << File.join(File.dirname(__FILE__), "/app/db")
require 'sqlite3'
require 'course'
require 'semester'
require 'student'