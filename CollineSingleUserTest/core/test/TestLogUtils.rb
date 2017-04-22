require 'rubygems'
require File.expand_path('../../utils/LogUtils',__FILE__) 

$logger = LogUtil.new().getlogger("D:\\workspace\\Ruby\\CollineSingleUserTest\\colline\\log\\script.log")
$logger.info("pass")