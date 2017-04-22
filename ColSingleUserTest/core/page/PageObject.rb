require 'rubygems'
require 'win32ole'
require 'watir-classic'  #watir和watir-classic不能同时存在

#加载默认路径引入公共类
require File.expand_path('../../utils/StringUtils',__FILE__)
require File.expand_path('../../utils/LogUtils',__FILE__)

class PageObject
  def initialize (browser)
    @browser = browser
  end

  # 访问器方法
  def getBrowser
    @browser
  end

  # 设置器方法
  def setBrowser=(value)
    @browser = value
  end

  # initialize
  def initialize_page (auto_log)
    $logger = LogUtil.new().getlogger(auto_log)

    # Attach HttpWatch
    $control = WIN32OLE.new('HttpWatch.Controller')
    $plugin = $control.IE.Attach(@browser.ie)
  end

  # test end
  def colse_page
    @browser.close
  end
end