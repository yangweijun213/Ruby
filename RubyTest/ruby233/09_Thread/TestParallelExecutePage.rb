# test case 并发执行3次

# 方法 1
#t1=Thread.new{require_relative 'SimpleBaiduSearch1.rb'}
#t1=Thread.new{require_relative 'SimpleBaiduSearch2.rb'}
#t1.join
#t2.join


t1 = Thread.new() do
     1.times do |i|
          sleep rand(5) # 让线程睡眠一段时间
          require_relative 'SimpleBaiduSearch1.rb'
          puts "thread1 #{i} "
     end
end


t2 = Thread.new() do
     1.times do |i|
          sleep rand(5) # 让线程睡眠一段时间
          require_relative 'SimpleBaiduSearch2.rb'
          puts "thread2 #{i}"
     end
end
t1.join
t2.join
puts "test complete"