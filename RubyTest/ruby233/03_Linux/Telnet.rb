#ref http://www.thinksaas.cn/topics/0/92/92958.html
# 使用telnet远程登录

require 'net/telnet'

# 连接到远程主机 foobar
telnet = Net::Telnet.new("Host" => "foobar") {|c| print c}

# 登陆
telnet.login("your name", "your password") {|c| print c}
# 登陆后等待提示

telnet.cmd("ls") {|c| print c}
# 执行命令后等待提示

# 稍复杂的例子
telnet.cmd("sleep 5 && echo foobar &") {|c| print c}

STDOUT.flush # <- 若没有这句的话，是很难看出程序已经运行到这里的

# 等待前面命令的输出
telnet.waitfor(/foobarZ/) {|c| print c}

# 结束登陆会话
telnet.cmd("exit") {|c| print c}
telnet.close