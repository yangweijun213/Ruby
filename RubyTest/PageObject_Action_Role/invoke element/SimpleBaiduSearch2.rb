#-------------------------------------------------------------# 
# 定义baidu element (不能使class and module). 
# Ruby23
# Launch IE browser. 
# install watir-classic (deprecated),不需要 browser driver
#-------------------------------------------------------------# 

require 'rubygems'    
require 'watir-classic'  #watir-classic已经废弃，已经整合在watir，所有两者不能同时存在 

class Test
  def set_filed
      $browser.text_field(:name=> "wd")
    end
    
    def click_search
      $browser.button(:id=> "su")
    end
end
  
