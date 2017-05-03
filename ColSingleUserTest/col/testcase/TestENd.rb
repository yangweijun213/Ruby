# 执行测试用例之后
require 'rubygems'

#加载默认路径引入公共类
require File.expand_path('../../conf/SysENV',__FILE__)
require File.expand_path('../../../service/action/AutoTearDown',__FILE__)

begin
  #收集app server log
  AutoTearDown.new().collect_appserverlog(host,user,pwd,linux_folder,windows_folder)
  #收集threaddump
  AutoTearDown.new().collect_appserver_threaddump(host,user,pwd,linux_folder,windows_folder)
  #收集ASH报告
  AutoTearDown.new().collect_oracle_ASH(host,user,pwd,linux_file,windows_folder)
  #收集AWR报告
  AutoTearDown.new().collect_oracle_AWR(host,user,pwd,linux_file,windows_folder)
rescue Exception => e
  $logger.error("执行测试用例之后: '#{e.message}','#{e.backtrace.inspect}'")
end