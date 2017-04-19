require 'test/unit/ui/console/testrunner'
require 'test/unit/testsuite'

require File.expand_path('../TC_MyTest',__FILE__) 
require File.expand_path('../TC_MyTest2',__FILE__) 

class TS_MyTests
  def self.suite
    suite = Test::Unit::TestSuite.new
    suite << TC_MyTest.suite
    suite << TC_MyTest2.suite
    return suite
  end
end

Test::Unit::UI::Console::TestRunner.run(TS_MyTests)