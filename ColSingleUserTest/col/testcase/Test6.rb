# 测试用例：TC0001
require 'rubygems'
require 'watir-classic'  #watir和watir-classic不能同时存在
require 'minitest/autorun'
require 'minitest/reporters'

#加载默认路径引入公共类
require File.expand_path('../../../service/action/AutoSetup',__FILE__)
require File.expand_path('../../../service/action/AutoTearDown',__FILE__)
require File.expand_path('../../../service/module/Login',__FILE__)
require File.expand_path('../../../service/module/SearchAgmtById',__FILE__)
require File.expand_path('../../conf/SysENV',__FILE__)

##html报告自定义
#Minitest::Reporters.use! [Minitest::Reporters::HtmlReporter.new(:title => $testReportTitle,:reports_dir => $testReportDir,:output_filename => $testReportName)]

class Test6 < MiniTest::Test
  
  def setup
    @auto_setup=AutoSetup.new($testBrowser)
    @auto_setup.before_test($testLog)
    @auto_setup.open_url($colUrl)
  end
  
  # step: login to home page
  def test_login
    @login = Login.new($testBrowser)
    @login.login_home($colUsrName,$colPwd,$httpwatch_result,"login_home_page",$curr_time,$httpwatch_fieldList)
  end
    
end