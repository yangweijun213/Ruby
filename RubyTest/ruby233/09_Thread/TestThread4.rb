# 监管数据交接的Queue类实现线程同步 - 生产者和消费者
# http://www.runoob.com/ruby/ruby-multithreading.html

require "thread"
puts "SizedQuee Test"
 
queue = Queue.new
 
producer = Thread.new() do
     3.times do |i|
          sleep rand(i) # 让线程睡眠一段时间
          queue << i
          puts "#{i} produced"
     end
end
 
consumer = Thread.new do
     3.times do |i|
          value = queue.pop
          sleep rand(i/2)
          puts "consumed #{value}"
     end
end
 
consumer.join