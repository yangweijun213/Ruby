# 启动测试用例之前
require 'rubygems'

#加载默认路径引入公共类
require File.expand_path('../../conf/SysENV',__FILE__)
require File.expand_path('../../../service/action/AutoSetup',__FILE__)

begin
  # test setup
  AutoSetup.new().before_test($testLog)
  # clean ash snapshot
  AutoSetup.new().clean_ash_snapshot(host,user,pwd,shell_script)
  $logger.info("clean ash snapshot complete")
  # clean awr snapshot
  AutoSetup.new().clean_awr_snapshot(host,user,pwd,shell_script)
  $logger.info("clean awr snapshot complete")
  # start ash
  AutoSetup.new().start_ash(host,user,pwd,shell_script)
  $logger.info("start ash")
  # start awr
  AutoSetup.new().start_awr(host,user,pwd,shell_script)
  $logger.info("start awr")
  # start dynatrace
  AutoSetup.new().start_dynatrace(host,user,pwd,shell_script)
  $logger.info("start dynatrace")
  # start threaddump
  AutoSetup.new().start_threaddump(host,user,pwd,shell_script)
  $logger.info("start threaddump")
  # launch colline
  AutoSetup.new().launch_colline(host,user,pwd,shell_script)
  $logger.info("launch colline")
rescue Exception => e
  $logger.error("启动测试用例之前: '#{e.message}','#{e.backtrace.inspect}'")
end
