#-------------------------------------------------------------# 
# Demo test for the Watir controller. 
# 
# Simple Google test written by Jonathan Kohl 10/10/04. 
# Purpose: to demonstrate the following Watir functionality: 
# * entering text into a text field, 
# * clicking a button, 
# * checking to see if a page contains text. 
# Test will search Google for the "pickaxe" Ruby book. 
#-------------------------------------------------------------# 
# the Watir controller 
require "rubygems"
require "watir" 

# set a variable 
test_site = "http://www.google.com/"   #search URL  google.com
Search_name = "watir"   #search name 
Content = "watir"   #search results 
#open the IE browser 
ie = Watir::Browser.new :ie
# print some comments 
puts "Beginning of test: Google search." 
puts " Step 1: go to the test site: " + test_site 
ie.goto test_site 
puts " Step 2: enter 'watir' in the search text field." 
#ie.text_field(:name, "wd").set "watir"      # "q" is the name of the search field 
ie.text_field(:name, "q").set Search_name     #search name
puts " Step 3: click the 'google submit' button." 
ie.button(:type, "submit").click    # "submit" is the type of the Search button 
puts " Expected Result:" 
puts " A google page with results should be shown. '#{Content} ' should be high on the list." 
puts " Actual Result:" 
if ie.text.include? "#{Content}" 
puts " Test Passed. Found the test string: '#{Content} '.Actual Results match Expected Results." 
else 
puts " Test Failed! Could not find: '#{Content} '." 
end 
puts " End of test: Google search."
puts " Last Step Close IE!!"
ie.close