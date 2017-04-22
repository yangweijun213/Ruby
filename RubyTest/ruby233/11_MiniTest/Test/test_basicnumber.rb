#ref: http://www.tuicool.com/articles/eUzIBb, https://github.com/seattlerb/minitest

require 'minitest/autorun'
require File.expand_path('../../BasicNumber',__FILE__) 

# 注意有些资料中，测试类不是继承自MiniTest::Test，
# 那是MiniTest 5之前的做法，MiniTest会通知你改正
class TestMyLife < MiniTest::Test
  # 这个方法会在各个测试之前被调用
  def setup
    @me = BasicNumber.new(2)
  end

  def test_add
     # assert_equal exp, act, msg
     assert_equal(3, @me.add(2), "test_add ")
  end
  
  def test_multiply  
          n=BasicNumber.new(10)  
          assert_equal(40,n.multiply(4),"This test about multiply is failure!")  
  end  

  def teardown
  end
end