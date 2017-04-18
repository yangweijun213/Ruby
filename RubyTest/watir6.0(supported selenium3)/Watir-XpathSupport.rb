#-------------------------------------------------------------# 
# Demo test for the watir-classic controller. 
# Ruby23
# Launch IE browser. 
#-------------------------------------------------------------# 

#require 'rubygems'    
#require 'watir-classic'  #watir和watir-classic不能同时存在 
#  
#ie = Watir::Browser.new  #方式1
##ie = Watir::Browser.new :ie #方式2, use Watir::Browser instead
##ie = Watir::IE.new #方式3, IE constant is deprecated
#ie.goto("http://www.runoob.com/") 
#ie.close


#-------------------------------------------------------------# 
# Demo test for the watir controller. 
# Ruby23
# Launch IE browser. 
#-------------------------------------------------------------# 

require 'rubygems'    
require 'watir'  #watir和watir-classic不能同时存在 
  
ie = Watir::Browser.new :ie  #方式1
ie.goto("http://www.runoob.com/") 

sleep(2)
#点击链接菜鸟笔记, 使用xpath定位 //*[@id='index-nav']/li[2]/a
ie.link(:xpath,"//a[@data-id='note']").click
