#-------------------------------------------------------------# 
# watir 6.0 Demo test for the watir controller
# Launch Firefox browser. 
# Selenium-webdriver 3.3.0 支持 firefox48.0和之后版本
#-------------------------------------------------------------# 

require 'rubygems'    
require 'watir'  #watir和watir-classic不能同时存在 

#launch firefox and start http://www.rubydoc.info/gems/watir/Watir/Browser
Firefox = Watir::Browser.start "http://www.runoob.com/", :firefox
Firefox.close 