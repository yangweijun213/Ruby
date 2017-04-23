#-------------------------------------------------------------# 
# 测试  role user. 
# Ruby23
#-------------------------------------------------------------# 

require 'rubygems'    
require 'watir-classic' 

# import BaiduPage.rb, BaiduPage为文件名
require File.join(File.dirname(__FILE__), "User")

browser= Watir::IE.new

#实例初始化 BaiduPage
user=User.new (browser)

#调用user对象的方法 
user.visit_baidu()

#调用User对象  方法search_text
user.search_text("test")

#调用User对象 方法   assert_text_exist
user.assert_text_exist("test")

#调用user对象的close page
user.close_page()