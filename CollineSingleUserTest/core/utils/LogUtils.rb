require 'logger'

class LogUtil
  
  def getlogger(log_filename)
  
    #Create a logger, daily log
    logger = Logger.new("#{log_filename}","daily")
    # log level: INFO
    logger.level = Logger::INFO
    return logger
  end

end