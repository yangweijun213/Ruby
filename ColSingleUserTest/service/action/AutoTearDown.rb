#############################################################
# 定义TearDown对象封装  #
# TearDown #
#############################################################

require 'rubygems'
require 'win32ole'
require 'watir-classic'  #watir和watir-classic不能同时存在

class AutoTearDown
  def initialize (browser)
    @browser = browser
  end
  
  #关闭页面
  def colse_browser
    @browser.close
  end
  
  #collect appserver logs, env config,datavolumn
  def collect_appserver
  end
  
  #collect appserver threaddump
  def collect_appserver_threaddump
  end
  
  #collect oracle AWR 
  def collect_oracle_AWR
  end
  
  #collect oracle ASH
  def collect_oracle_ASH
  end
  
end