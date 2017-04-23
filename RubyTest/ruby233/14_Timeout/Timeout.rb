# ruby timeout 机制，
# http://ruby-doc.org/stdlib-2.1.1/libdoc/timeout/rdoc/Timeout.html
require 'timeout'

begin
  Timeout::timeout(3){
    sleep 5
    puts "No timeout"
  }
rescue Exception => e
  puts "timeout"
  puts e.message
  puts e.backtrace.inspect
end

puts "continue"
