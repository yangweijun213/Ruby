# Using SCP/SSH in Ruby with a pem file in an Amazon EC2 instance
# http://stackoverflow.com/questions/19089485/using-scp-ssh-in-ruby-with-a-pem-file-in-an-amazon-ec2-instance
require 'net/ssh'
require 'logger'

host = '54.183.196.177'
user = 'ec2-user'

Net::SSH.start( host, user, :keys => [ "ruby233/03_Linux/lrm-db-pst-only.pem" ],:verbose => :debug ) do |ssh|
    #执行shell
    #result = ssh.exec!"./jeff/Shell/testSet.sh"
   
    #执行 pwd
    result = ssh.exec!"pwd"
    # result = ssh.exec!('pwd')
    
    puts result
end