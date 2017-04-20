require 'net/ssh'
require 'net/scp'

class LinuxUtils
   
  def connect_linux_server(host,user,pass)
        
    Net::SSH.start( host, user, :password => pass ) do |ssh|
        #执行shell
        result = ssh.exec!"./jeff/Shell/testSet.sh"        
        puts result
    end
    
  end
end