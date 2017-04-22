# 测试驱动 (Excel)+行为驱动+用户角色
require 'rubygems'

#加载默认路径引入公共类
require File.expand_path('../../conf/Properties',__FILE__) 
require File.expand_path('../../../service/user/Admin',__FILE__) 
require File.expand_path('../../../core/utils/TestDataUtils',__FILE__) 

    # 定义浏览器
    browser= Watir::IE.new
    
    # XML数据驱动
    xmlpath = "D:\\workspace\\Ruby\\CollineSingleUserTest\\colline\\testdata\\Login.xml"
    testdata_utils = TestDataUtils.new()
    testdata = Array.new #定义数组
    
    url = testdata_utils.get_xmldata("colline/login/url",xmlpath)
    uname = testdata_utils.get_xmldata("colline/login/username",xmlpath)
    pwd = testdata_utils.get_xmldata("colline/login/password",xmlpath)
    
    # 创建admin对象
    admin=Admin.new(browser,url,uname,pwd)
    # 测试初始化
    admin.test_initial()
    # 打开colline
    admin.visit_openpage("open page","login")
    # 登陆页面
    admin.visit_login("login","Home")
    # 跳到agreement 页面
    admin.visit_goto_agreement_search_page("goto agreement search page","Collateral - Agreement Search")
    # 搜索 agreement id
    admin.visit_search_agreement_by_id("agreement_search_by_system_id","12101","12101")

