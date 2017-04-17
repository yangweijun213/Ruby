#-------------------------------------------------------------# 
# 测试   Module SearchBehavior.rb
# Ruby23
#-------------------------------------------------------------# 

require 'rubygems'    
require 'watir-classic' 

require File.join(File.dirname(__FILE__), "User2")

#实例初始化 User
user2=User2.new

#调用user对象的方法 
user2.visit_baidu()

#调用User对象  方法search_text
user2.search_text("test")

#调用User对象 方法   assert_text_exist
user2.assert_text_exist("test")