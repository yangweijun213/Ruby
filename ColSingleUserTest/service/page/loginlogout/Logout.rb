############################################################################
#   主要为被测系统的元素集合，一个元素一个方法  #
#   注销元素   #
############################################################################
require 'rubygems'
require 'watir-classic'  #watir和watir-classic不能同时存在

  
  #系统注销按钮
  #元素名："用户输入框"
  def colSys_logout_btn
    @browser.div(:text => "Collateral", :id => "oM_m1")
  end
  