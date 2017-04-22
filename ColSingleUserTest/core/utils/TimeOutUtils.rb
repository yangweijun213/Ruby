# set timeout

require File.expand_path('../LogUtils',__FILE__)

class TimeOutUtils 
  # Set timeout for page element
  # second, element_exist (browser.button(:id=> "su1").exists? )
  def pageload_timeout (second,element_exist)
    begin
      Watir::Wait.until(second) {element_exist} #测试timeout
    rescue Exception => e #处理错误
      $logger.info("Page imed out #{element_exist}, e.message,  e.backtrace.inspect.")
    end
  end
end