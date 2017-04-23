require 'rubygems'
require 'win32ole'
require 'watir-classic'  #watir和watir-classic不能同时存在

#加载默认路径引入公共类
require File.expand_path('../../utils/StringUtils',__FILE__)
require File.expand_path('../../utils/LogUtils',__FILE__)

class Setup
  #页面打开之前
  def before_openpage (auto_log)
    $logger = LogUtil.new().getlogger(auto_log)

    # Attach HttpWatch
    $control = WIN32OLE.new('HttpWatch.Controller')
    $plugin = $control.IE.Attach(@browser.ie)
  end
end