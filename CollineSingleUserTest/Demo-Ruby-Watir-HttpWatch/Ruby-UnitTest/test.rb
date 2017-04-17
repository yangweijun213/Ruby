require 'test/unit/ui/console/testrunner'
require File.expand_path('../TC_MyTest',__FILE__) 

Test::Unit::UI::Console::TestRunner.run(TC_MyTest)
