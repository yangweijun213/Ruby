#############################################################
# 定义TearDown对象封装  #
# TearDown #
#############################################################

require 'rubygems'
require 'win32ole'
require 'watir-classic'  #watir和watir-classic不能同时存在

class AutoSetup
  def initialize (browser)
    @browser = browser
  end
  
  # 关闭页面
  def colse_browser
    @browser.close
  end
end