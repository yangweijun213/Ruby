# http://rubyer.me/blog/1133/
# 从windows上 连接 linux server,然后执行 linux命令 ls
# gem install net-ssh
# gem install net-scp

require 'net/ssh'
require 'net/scp'

host = '172.20.20.90'
user = 'test'
pass = 'pst@1234'

Net::SSH.start( host, user, :password => pass ) do |ssh|
    #执行shell
    #result = ssh.exec!"./jeff/Shell/testSet.sh"
    result = ssh.exec!"./server/colline/standalone/RELEASE_13_0_0_SP17/bin/launch.sh"
   
    #执行 pwd
    #result = ssh.exec!"pwd"
    # result = ssh.exec!('pwd')
    
    puts result
end