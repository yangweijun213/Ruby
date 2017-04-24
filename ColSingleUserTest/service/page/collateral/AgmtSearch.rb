############################################################################
#   主要为被测系统的元素集合，一个元素一个方法  #
#   AgreementSearch 页面元素   #
############################################################################
require 'rubygems'
require 'watir-classic'  #watir和watir-classic不能同时存在

  
  #system id 输入框
  #元素名："system id 输入框"
  def agmt_search_by_system_id_field
    @browser.text_field(:id => 'systemId')
  end
  
  #点击
  #元素名："search 按钮"
  def agmt_search_btn
    @browser.button(:id, 'submit')
  end
