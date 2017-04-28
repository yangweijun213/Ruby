# http://rubyer.me/blog/1133/
# windows上传文件到linux,  从linux上下载文件到windows  (上传和下载一个目录，包括子目录中的所有文件。加上“:recursive => true”参数)

require 'net/ssh'
require 'net/scp'

HOST = '172.20.20.90'
USER = 'test'
PASS = 'pst@1234'

Net::SSH.start( HOST, USER, :password => PASS ) do|ssh|
  ssh.scp.download!( 'logs', '.', :recursive => true )
end