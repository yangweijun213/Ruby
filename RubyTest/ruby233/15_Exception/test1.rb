#使用raise, ensure,rescue,捕获异常
begin
  result=20/0
  puts result            #没有使用raise 语句抛出
rescue Exception => e #处理错误 
  puts e.message
  puts e.backtrace.inspect
ensure
  puts "Ensuring execution" #最后确保执行
end