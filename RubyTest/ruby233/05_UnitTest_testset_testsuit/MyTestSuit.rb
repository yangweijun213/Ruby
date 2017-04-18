#创建test suit - MyTestCase, MyTestCase2

require 'test/unit/ui/console/testrunner'
require 'test/unit/testsuite'

require File.expand_path('../MyTestCase',__FILE__)  #引入testcase
#require File.expand_path('../MyTestCase2',__FILE__) 

class TS_MyTests
  def self.suite
    suite = Test::Unit::TestSuite.new
    suite << MyTestCase.suite  # 第一个 套件被执行
   # suite << MyTestCase2.suite # 第二个套件被执行
    return suite
  end
end

Test::Unit::UI::Console::TestRunner.run(TS_MyTests)