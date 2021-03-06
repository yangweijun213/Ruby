#-------------------------------------------------------------#
# 加入角色用户. 既然是行为驱动，既然是模拟用户实际操作
# 定义一个角色对baidu page对象的操作
# Ruby23
#-------------------------------------------------------------#

require 'rubygems'
require 'watir-classic'

# load BaiduPage
require File.join(File.dirname(__FILE__), "BaiduPage")

class User
  #定义构造方法  initialize
  def initialize (browser)
    @browser= browser
    @page=BaiduPage.new(@browser)
  end

  #定义方法  visit_baidu
  def visit_baidu
    @page.open_page
  end

  #定义方法 search_text
  def search_text text
    @page.search(text)
  end

  #定义方法 assert_text_exist
  def  assert_text_exist text
    @page.has_text(text)
  end
  
  #关闭页面
  def close_page
    @page.close_browser
  end

end