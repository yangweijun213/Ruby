#-------------------------------------------------------------#
# 加入角色用户. 既然是行为驱动，既然是模拟用户实际操作
# 在User对象中include该Module
# Ruby23
#-------------------------------------------------------------#

require 'rubygems'
require 'watir-classic'

require File.join(File.dirname(__FILE__), "SearchBehavior")

class User2
  def initialize
    @browser = Watir::IE.new
  end
 
 include SearchBehavior

end