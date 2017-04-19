require 'test/unit'
require File.expand_path('../BasicNumber2',__FILE__) 

class TC_MyTest2  < Test::Unit::TestCase    #T必须大写,否则通不过  
    def test_add  
        n=BasicNumber2.new(10)  
        assert_equal(14,n.add(4),"This test about add is failure!")     
        #14 期望值，n.add(4) 实际值，"This test about add is failure!" 出错时的提示。  
    end  
    def test_multiply  
        n=BasicNumber2.new(10)  
        assert_equal(4,n.multiply(4),"This test about multiply is failure!")  
    end  
end  