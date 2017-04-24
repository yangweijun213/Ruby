#############################################################
# 定义page对象封装  #
# CollateralSearchAgreement #
#############################################################

require 'rubygems'
require 'watir-classic'  #watir和watir-classic不能同时存在

#加载默认路径引入公共类
require File.expand_path('../../page/collateral/AgmtSearch',__FILE__)
require File.expand_path('../../page/menu/CollateralMenu',__FILE__)

class CollateralSearchAgmt
  
  def initialize (browser)
    @browser = browser
  end
  
  #go to Colline Agreement Search
  def goto_agmt_search 
    onmouseover_agmt_search_menu.wait_until_present($waitTime)
    onmouseover_agmt_search_menu.fire_event('onmouseover')
    sleep($sleepTime)
    onmouseover_agmtDetails_menu.fire_event('onmouseover')
    sleep($sleepTime)
    click_agmt_search_menu.click
  end
  
  #断言  Colline Agreement Search
#  def assert_colline_agmt_search
#    assert(agmt_search_by_system_id_field.when_present($waitTime).exist?,"失败，未跳转到Colline Agreement Search")
#  end
  
  #agreement Search By SystemId
  def agmt_search_by_system_id(systemid)
    agmt_search_by_system_id_field.wait_until_present($waitTime)
    agmt_search_by_system_id_field.set "#{systemid}"
    #等待systemid输完,进行下一步
    break while systemid == agmt_search_by_system_id_field.value
    agrmt_search_btn.click
  end
  
  #断言 agreement_search_by_system_id
  def assert_agmt_search_by_system_id
    assert(agmt_search_by_system_id_field.when_present($waitTime).exist?,"失败，未找到SystemId")
  end
  
end