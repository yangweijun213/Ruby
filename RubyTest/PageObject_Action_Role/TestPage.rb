#-------------------------------------------------------------# 
# 测试  page对象. 
# Ruby23
#-------------------------------------------------------------# 

require 'rubygems'    
require 'watir-classic' 

# import BaiduPage.rb, BaiduPage为文件名
require File.join(File.dirname(__FILE__), "BaiduPage")

#实例化 browser
browser= Watir::IE.new

#实例初始化
page=BaiduPage.new(browser)

#page 对象调用方法 open page
page.open_page()

#page对象 调用方法search
page.search("test")

#page对象 调用方法 has_text
page.has_text("test")

#关闭page
page.close_browser()