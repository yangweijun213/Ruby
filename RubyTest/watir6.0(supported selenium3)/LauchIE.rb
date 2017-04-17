#-------------------------------------------------------------# 
# watir 6.0 Demo test for the watir controller
# Launch IE browser. 
#-------------------------------------------------------------# 

require 'rubygems'    
require 'watir'  
 
# 方法1： https://github.com/watir/watir
ie = Watir::Browser.new :ie  #方式1
ie.goto("http://www.runoob.com/") 
ie.close

# 方法2: lauch ie and start http://www.rubydoc.info/gems/watir/Watir/Browser
ie2 = Watir::Browser.start "http://www.runoob.com/", :ie
ie2.close 