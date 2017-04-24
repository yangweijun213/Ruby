#############################################################
# 使用Module来封装不同的行为  #
# 封装login 行为  #
#############################################################

require 'rubygems'
require 'watir-classic'  #watir和watir-classic不能同时存在

#加载默认路径引入公共类
require File.expand_path('../../action/SysLoginLogout',__FILE__)
require File.expand_path('../../action/AutoHttpwatch',__FILE__)

class Login 
  def initialize (browser)
    @browser = browser
    @sysloginlogout = SysLoginLogout.new(@browser)
    @autohttpwatch = AutoHttpwatch.new()
  end

  #step: login to home page
  def login_home (username,password,httpwatch_result,transaction_name,curr_time,httpwatch_fieldList)
    begin
       @autohttpwatch.before_transaction()
       @sysloginlogout.login(username,password)
       @sysloginlogout.login_success_assert
#       $logger.info("#{transaction_name}: Test Passed. #{@sysloginlogout.login_success_assert}")
       @autohttpwatch.after_transaction(httpwatch_result,transaction_name,curr_time,httpwatch_fieldList) 
    rescue Exception => e
       $logger.error("#{transaction_name}: '#{e.message}','#{e.backtrace.inspect}'")
    end
  end  
end
