#-------------------------------------------------------------# 
# 超时和元素等待. 
# install watir-classic (deprecated),不需要 browser driver
# http://www.cnblogs.com/fithon/p/6689495.html
#-------------------------------------------------------------# 

require 'rubygems'    
require 'watir-classic'  #watir-classic已经废弃，已经整合在watir，所有两者不能同时存在 

# set a variable 
test_site = "http://www.baidu.com/"   #search URL  baidu.com
Search_name = "test"   #search name 
Content = "test"   #search results 

#ie = Watir::Browser.new  
##ie = Watir::Browser.new :ie #方式2, use Watir::Browser instead
browser = Watir::IE.new #方式3 IE constant is deprecated

# open page
#browser.goto("http://www.baidu.com/") 
browser.goto test_site

# Setting a text field
#browser.text_field(:name=> "wd").set("test")
# 等待test输完，再进行下一步
break while browser.text_field(:name=> "wd").set Search_name
# 设置超时，等待10秒，如果10秒未出现就超时
#browser.button(:id=> "su").wait_until_present(10)

# 设置超时，等待10秒，然后点击click。如果10秒未出现就超时
browser.button(:id=> "su").when_present(10).click

# Checking for text in a page
#if browser.text.include?("test")
if browser.text.include? Content 
puts " Test Passed. Found the test string: '#{Content} '.Actual Results match Expected Results." 
else 
puts " Test Failed! Could not find: '#{Content} '." 
end

#close ie
#browser.close