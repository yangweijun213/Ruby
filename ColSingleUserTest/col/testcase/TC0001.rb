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
require File.expand_path('../../../service/page/loginlogout/Logout',__FILE__)
require File.expand_path('../../conf/SysENV',__FILE__)

class TC0001 < MiniTest::Test
  # 测试开始之前

  ##html报告自定义
  Minitest::Reporters.use! [Minitest::Reporters::HtmlReporter.new(:title => $testReportTitle,:reports_dir => $testReportDir,:output_filename => $testReportName)]

  # step:login to home page
  def test_login
    @auto_setup=AutoSetup.new($testBrowser)
    @auto_setup.before_test($testLog)
    @auto_setup.open_url($colUrl)

    begin
      @login = Login.new($testBrowser)
      transaction_name = "login_to_home_page"

      # 数据参数化
      xmltestdata = File.expand_path('../../testdata/Login.xml',__FILE__)
      uname = @auto_setup.load_xml_testdata("colline/login/username",xmltestdata)
      pwd = @auto_setup.load_xml_testdata("colline/login/password",xmltestdata)
      
      # 登录home page
      @login.test_login_home(uname,pwd,$httpwatch_result,transaction_name,$curr_time,$httpwatch_fieldList)
      
      # Assert
      @browser=$testBrowser
      #assert(colSys_logout_btn.when_present($waitTime).exist?,"登录失败，未跳转到 home page")
      assert_equal(true,false,"登录失败，未跳转到 home page")
      
    rescue Exception => e
      $logger.error("#{transaction_name}: '#{e.message}','#{e.backtrace.inspect}'")
    end
  end

  # 测试之后
  #  def teardown
  #    @autoteardown = AutoTearDown.new($testBrowser)
  #    @autoteardown.colse_browser()
  #  end

end