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
  def collect_appserverlog (host,user,pwd,linux_folder,windows_folder)
    LinuxUtils.new().download_folder_subfolder_from_linux(host,user,pwd,linux_folder,windows_folder)
  end
  
  #collect appserver threaddump
  def collect_appserver_threaddump (host,user,pwd,linux_folder,windows_folder)
    LinuxUtils.new().download_folder_subfolder_from_linux(host,user,pwd,linux_folder,windows_folder)
  end
  
  #collect oracle AWR 
  def collect_oracle_AWR (host,user,pwd,linux_file,windows_folder)
    LinuxUtils.new().download_file_from_linux(host,user,pwd,linux_file,windows_folder)
  end
  
  #collect oracle ASH
  def collect_oracle_ASH (host,user,pwd,linux_file,windows_folder)
    LinuxUtils.new().download_file_from_linux(host,user,pwd,linux_file,windows_folder)
  end
  
end