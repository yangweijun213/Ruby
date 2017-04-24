#############################################################
# 封装Setup  #
# Setup #
#############################################################

require 'rubygems'
require 'win32ole'
require 'watir-classic'  #watir和watir-classic不能同时存在

#加载默认路径引入公共类
require File.expand_path('../../../core/utils/LogUtils',__FILE__)

class AutoSetup
  def initialize (browser)
    @browser = browser
  end

  #Before Test
  def before_test(testLog)
    $logger = LogUtil.new().getlogger(testLog)
    #Attach HttpWatch
    $control = WIN32OLE.new('HttpWatch.Controller')
    $plugin = $control.IE.Attach(@browser.ie)
  end

  #打开URL
  def open_url (url)
      @browser.goto("#{url}")
  end

end