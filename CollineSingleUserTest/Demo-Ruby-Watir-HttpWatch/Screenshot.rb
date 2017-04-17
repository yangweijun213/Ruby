#reference: http://www.rubydoc.info/gems/watir/Watir/Screenshot

require 'rubygems'    
require 'watir'  #watir和watir-classic不能同时存在 
  
ie = Watir::Browser.new :ie  #方式1
ie.goto("http://www.runoob.com/") 
sleep(2)
ie.screenshot.save "screenshot.png"
sleep(2)
ie.close
