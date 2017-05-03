#############################################################
# 封装Setup  #
# Setup #
#############################################################

require 'rubygems'
require 'win32ole'
require 'watir-classic'  #watir和watir-classic不能同时存在

#加载默认路径引入公共类
require File.expand_path('../../../core/utils/LogUtils',__FILE__)
require File.expand_path('../../../core/utils/TestDataUtils',__FILE__) 
require File.expand_path('../../../core/utils/LinuxUtils',__FILE__) 

class AutoSetup
  def initialize (browser)
    @browser = browser
  end

  # Before Test
  # 参数：testLog
  def before_test(testLog)
    $logger = LogUtil.new().getlogger(testLog)
    #Attach HttpWatch
    $control = WIN32OLE.new('HttpWatch.Controller')
    $plugin = $control.IE.Attach(@browser.ie)
  end

  # 打开URL
  # 参数：url
  def open_url (url)
      @browser.goto("#{url}")
  end
  
  # 数据驱动 - 加载xml
  # 参数：  eg.colline/login/url
  def load_xml_testdata (tree,xmlpath)
    testdata_utils = TestDataUtils.new()
    testdata = Array.new #定义数组
    data = testdata_utils.get_xmldata(tree,xmlpath)
    return data
  end
  
  #launch Colline
  def launch_colline (host,user,pwd,shell_script)
    LinuxUtils.new().execute_shell(host,user,pwd,shell_script)
  end
  
  #clean oracle AWR snapshot
  def clean_awr_snapshot (host,user,pwd,shell_script)
    LinuxUtils.new().execute_shell(host,user,pwd,shell_script)
  end
  
  #clean oracle ASH snapshot
  def clean_ash_snapshot (host,user,pwd,shell_script)
    LinuxUtils.new().execute_shell(host,user,pwd,shell_script)
  end
    
  #start oracle AWR
  def start_awr (host,user,pwd,shell_script)
    LinuxUtils.new().execute_shell(host,user,pwd,shell_script)
  end
    
  #start oracle ASH
  def start_ash (host,user,pwd,shell_script)
    LinuxUtils.new().execute_shell(host,user,pwd,shell_script)
  end
     
  #start Dynatrace monitor
  def start_dynatrace (host,user,pwd,shell_script)
    LinuxUtils.new().execute_shell(host,user,pwd,shell_script)
  end
  
  #start threaddump
  def start_threaddump (host,user,pwd,shell_script)
    LinuxUtils.new().execute_shell(host,user,pwd,shell_script)
  end
  
  #clean app server download report
  def clean_appserver_download_report
  end
  
end