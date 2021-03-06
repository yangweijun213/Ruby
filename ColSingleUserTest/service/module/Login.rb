#############################################################
# 使用Module来封装不同的行为  #
# 封装login 行为  #
#############################################################

require 'rubygems'
require 'watir-classic'  

#加载默认路径引入公共类
require File.expand_path('../../action/SysLoginLogout',__FILE__)
require File.expand_path('../../action/AutoHttpwatch',__FILE__)
require File.expand_path('../../page/loginlogout/Logout',__FILE__)

class Login
  def initialize (browser)
    @browser = browser
    @sysloginlogout = SysLoginLogout.new(@browser)
    @autohttpwatch = AutoHttpwatch.new()
  end

  #step: login to home page
  def test_login_home (username,password,httpwatch_result,transaction_name,curr_time,httpwatch_fieldList)
    begin
      @autohttpwatch.before_transaction()
      @sysloginlogout.login(username,password)
#      checkpoint = "Home"
#      if @sysloginlogout.login_success_assert(checkpoint)
#        $logger.info("#{transaction_name}: Test Passed. Found the test string: '#{checkpoint} '.Actual Results match Expected Results. ") 
#      else
#        $logger.error("#{transaction_name}: Test Failed! Could not find: '#{checkpoint} '.")
#        @browser.screenshot.save "#{$testScreenshot}/#{transaction_name}_#{$curr_time}.png"
#      end
      @autohttpwatch.after_transaction(httpwatch_result,transaction_name,curr_time,httpwatch_fieldList)
    rescue Exception => e
      $logger.error("#{transaction_name}: '#{e.message}','#{e.backtrace.inspect}'")
    end
  end
end
