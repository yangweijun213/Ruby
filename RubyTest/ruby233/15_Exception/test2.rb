#使用raise, ensure,rescue,捕获异常

begin
  raise 'A test exception.' #使用 raise 语句抛出异常
rescue Exception => e #处理错误 
  puts e.message
  puts e.backtrace.inspect
ensure
  puts "Ensuring execution" #最后确保执行
end


