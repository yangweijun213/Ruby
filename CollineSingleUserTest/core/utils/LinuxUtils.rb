require 'net/ssh'
require 'net/scp'

class Linux
   
  def connectLinuxServer(host,user,pass)
        
    Net::SSH.start( host, user, :password => pass ) do |ssh|
        #执行shell
        result = ssh.exec!"./jeff/Shell/testSet.sh"        
        puts result
    end
    
  end
end