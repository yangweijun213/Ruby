#-------------------------------------------------------------# 
# watir 6.0 Demo test for the Watir controller. 
# Launch Chrome browser. 
#-------------------------------------------------------------# 

require 'rubygems'    
require 'watir' 

# 方式1: launch chrome https://github.com/watir/watir
chrome = Watir::Browser.new :chrome 
chrome.goto("http://www.runoob.com/")
chrome.close  

# 方式2: launch chrome and start http://www.rubydoc.info/gems/watir/Watir/Browser
chrome2 = Watir::Browser.start "http://www.runoob.com/", :chrome
chrome2.close 