require 'test/unit'
require File.expand_path('../../LoggerFactory',__FILE__) #返回当前目录的上一级目录

class TestLoggerFactory <Test::Unit::TestCase    #T必须大写,否则通不过 
  
  def test_getLogger    
    #得到 logger对象
    logger = LoggerFactory.new().getLogger(TC001)
    asset_equal(1,1,"true")
  end
end