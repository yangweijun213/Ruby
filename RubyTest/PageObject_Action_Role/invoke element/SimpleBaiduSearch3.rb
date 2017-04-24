#-------------------------------------------------------------# 
# 直接使用调用element (SimpleBaiduSearch). 
# Ruby23
# Launch IE browser. 
# install watir-classic (deprecated),不需要 browser driver
#-------------------------------------------------------------# 

require 'rubygems'    
require 'watir-classic'  #watir-classic已经废弃，已经整合在watir，所有两者不能同时存在 
require File.expand_path('../SimpleBaiduSearch2',__FILE__)

# set a variable 
$test_site = "http://www.baidu.com/"   #search URL  baidu.com
$Search_name = "test"   #search name 
$Content = "test"   #search results 

#ie = Watir::Browser.new  
##ie = Watir::Browser.new :ie #方式2, use Watir::Browser instead
$browser = Watir::IE.new #方式3 IE constant is deprecated

# open page
#browser.goto("http://www.baidu.com/") 
$browser.goto $test_site

# set text field
set_filed.set $Search_name

# Clicking a button
click_search.click

# Checking for text in a page
#if browser.text.include?("test")
if $browser.text.include? $Content 
puts " Test Passed. Found the test string: '#{$Content} '.Actual Results match Expected Results." 
else 
puts " Test Failed! Could not find: '#{$Content} '." 
end

#close ie
#browser.close