#############################################################
# 封装HttpWatch的方法  #
# Test Setup #
#############################################################

require 'rubygems'
require 'win32ole'
require 'watir-classic'  #watir和watir-classic不能同时存在

#加载默认路径引入公共类
require File.expand_path('../../../core/utils/LogUtils',__FILE__)

class AutoHttpwatch
  #before transaction
  def before_transaction
    $plugin.Clear()
    $plugin.Record()
  end

  #After transaction
  def after_transaction (httpwatch_result,transaction_name,curr_time,httpwatch_fieldList)
    $plugin.Stop()
    $plugin.Log.ExportFieldsAsCSV("#{httpwatch_result}\\#{transaction_name}_#{curr_time}.csv","#{httpwatch_fieldList}")
  end
end