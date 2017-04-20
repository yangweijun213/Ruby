# 测试驱动 (XML)+行为驱动+用户角色
require 'rubygems'

#加载默认路径引入公共类
require File.expand_path('../../conf/Properties',__FILE__) 
require File.expand_path('../../../service/user/Admin',__FILE__) 
require File.expand_path('../../../core/utils/TestDataUtils',__FILE__) 

# 定义浏览器
browser= Watir::IE.new

# Excel数据驱动
excelpath = "D:\\workspace\\Ruby\\CollineSingleUserTest\\colline\\testdata\\Login.xlsx"
testdata_utils = TestDataUtils.new()
testdata = Array.new
testdata = testdata_utils.get_exceldata(excelpath)

url = testdata.at(0)
uname = testdata.at(1)
pwd = testdata.at(2)

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
