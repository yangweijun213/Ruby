#############################################################
# 使用Module来封装不同的行为功能  #
# 封装 Search Agreement By ID 行为  #
#############################################################

require 'rubygems'
require 'watir-classic'  #watir和watir-classic不能同时存在

#加载默认路径引入公共类
require File.expand_path('../../action/CollateralSearchAgmt',__FILE__)
require File.expand_path('../../action/AutoHttpwatch',__FILE__)

class SearchAgmtById
  def initialize (browser)
    @browser = browser
    @collateralsearchagmt = CollateralSearchAgmt.new(@browser)
    @autohttpwatch = AutoHttpwatch.new()
  end

  #step: Collateral->Agreements Details->Agreement Search
  def goto_agmt_search (httpwatch_result,transaction_name,curr_time,httpwatch_fieldList)
    begin
       @autohttpwatch.before_transaction(httpwatch_result,transaction_name,curr_time,httpwatch_fieldList)
       @collateralsearchagmt.goto_agreement_search()
#       @collateralsearchagmt.assert_colline_agmt_search()
       $logger.info("#{transaction_name}: Test Passed. ")
       @autohttpwatch.after_transaction(httpwatch_result,transaction_name,curr_time,httpwatch_fieldList) 
    rescue Exception => e
       $logger.error("#{transaction_name}: '#{e.message}','#{e.backtrace.inspect}'")
    end
  end  
  
  #step: Search agreement by id
  def search_agmt_by_id (systemid,httpwatch_result,transaction_name,curr_time,httpwatch_fieldList)
    begin
       @autohttpwatch.before_transaction(httpwatch_result,transaction_name,curr_time,httpwatch_fieldList)
       @collateralsearchagmt.agmt_search_by_system_id(systemid)
#       @collateralsearchagmt.assert_agmt_search_by_system_id()
       $logger.info("#{transaction_name}: Test Passed. ")
       @autohttpwatch.after_transaction(httpwatch_result,transaction_name,curr_time,httpwatch_fieldList) 
    rescue Exception => e
       $logger.error("#{transaction_name}: '#{e.message}','#{e.backtrace.inspect}'")
    end
  end 
  
end
