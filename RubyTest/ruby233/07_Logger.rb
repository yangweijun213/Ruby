#reference: http://ruby-doc.org/stdlib-2.3.3/libdoc/logger/rdoc/Logger.html
require 'logger'

#Create a logger for the file which has the specified name.
#logger = Logger.new("script.log")

#Create a logger for the specified file.
#file = File.open('foo.log', File::WRONLY | File::APPEND)
#logger = Logger.new(file)

#Create a logger which ages the logfile daily
var = "script.log"
logger = Logger.new("#{var}", "daily")
#logger = Logger.new('script.log', 'daily')

#输出不同级别的日志
logger.level = Logger::INFO

# How to log a message
logger.error("Created logger")
logger.info("Program started")
logger.warn("Nothing to do!")

#close a logger
logger.close