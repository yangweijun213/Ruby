require 'logger'
require File.dirname(__FILE__) + '/Common'

class LoggerClass
  
  def getLogger()
    logFileName = "script_Common.new().getStrftime().log"
    #Create a logger
    logger = Logger.new("#{logFileName}")
    #输出不同级别的日志
    logger.level = Logger::INFO
    return logger
  end

end