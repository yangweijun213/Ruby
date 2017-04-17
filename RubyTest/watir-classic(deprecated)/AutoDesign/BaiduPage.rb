#-------------------------------------------------------------# 
# 定义一个Page对象来封装baidu页面. 
# 对于动则几十个甚至上百个页面的网站来说便显得过于混乱，既然要面向对象，我们就希望将不同的页面也用对象来封装，于是引入Page对象，既可完成对页面的逻辑封装，又实现了分层重用
#-------------------------------------------------------------# 

require 'rubygems'    
require 'watir-classic' 

class BaiduPage
  
  #定义构造方法  initialize
  def initialize (browser)
    #@browser= Watir::IE.new
    #将browser对象传给实例变量 @browser
    @browser = browser
    @browser.goto("http://www.baidu.com/") 
  end
  
  #定义方法search
  def search str
    #@browser.text_field(:name=> "wd").set str #这2个方式都可以
    @browser.text_field(:name=> "wd").set(str)
    @browser.button(:id=> "su").click
  end
  
  #定义方法has_text
  def has_text text
    if @browser.text.include?(text)
    puts " Test Passed. Found the test string: #{text}.Actual Results match Expected Results." 
    else 
    puts " Test Failed! Could not find: #{text}." 
    end
  end
  
end