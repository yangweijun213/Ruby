# 实现截图
# http://www.rubydoc.info/gems/watir/Watir/Screenshot

require 'rubygems'    
#require 'watir'  #watir和watir-classic不能同时存在 
require 'watir-classic'

ie = Watir::IE.new
#ie = Watir::Browser.new :ie  #方式1
ie.goto("http://www.runoob.com/") 
sleep(2)
#保存在项目根目录
ie.screenshot.save "screenshot.png"
sleep(2)
ie.close
