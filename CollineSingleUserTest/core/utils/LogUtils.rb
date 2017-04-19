require 'logger'
require File.dirname(__FILE__) + '/Common'

class LogUtil
  
  def getLogger(logFileName)
  
    #Create a logger, daily log
    logger = Logger.new("#{logFileName}'","daily")
    # log level: INFO
    logger.level = Logger::INFO
    return logger
  end

end