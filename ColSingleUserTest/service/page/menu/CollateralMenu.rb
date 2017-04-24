############################################################################
#   主要为被测系统的元素集合，一个元素一个方法  #
#   Collateral 的菜单 元素   #
############################################################################
require 'rubygems'
require 'watir-classic'  #watir和watir-classic不能同时存在

class CollateralMenu
  
  def initialize (browser)
    @browser = browser
  end
  
  #一级菜单 Collateral
  #元素名："一级菜单Collateral"
  def onmouseover_agmt_search_menu  
    @browser.div(:text => "Collateral", :id => "oM_m6")
  end

  #选择二级菜单 Agreement Details
  #元素名："二级菜单 Agreement Details"
  def onmouseover_agmtDetails_menu
    @browser.div(:text => "Agreement Details")
  end
  
  #点击三级菜单 Agreement Search
  #元素名："三级菜单Agreement Search"
  def click_agmt_search_menu
    @browser.div(:text => "Agreement Search")
  end
  
end