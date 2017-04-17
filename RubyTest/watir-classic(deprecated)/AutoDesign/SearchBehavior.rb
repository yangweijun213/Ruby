#-------------------------------------------------------------# 
# 用ruby的Module来封装不同的行为功能
# 定义一个module来封装baidu search行为
# Ruby23
#-------------------------------------------------------------# 

require 'rubygems'    
require 'watir-classic' 


module SearchBehavior
  def visit_baidu
    @page = BaiduPage.new(@browser)
  end
  
  def search_text text
    @page.search text
  end
  
  def assert_text_exist text
    @page.has_text text
  end

end