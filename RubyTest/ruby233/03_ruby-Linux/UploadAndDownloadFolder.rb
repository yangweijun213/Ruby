# http://rubyer.me/blog/1133/
# windows上传文件到linux,  从linux上下载文件到windows (不需要执行命令，仅仅是传输文件)

require 'net/ssh'
require 'net/scp'

HOST = '172.20.20.90'
USER = 'test'
PASS = 'pst@1234'

Net::SCP.start( HOST, USER, :password => PASS ) do |scp|
   scp.upload!( 'd:/server_test.log', '/home/test/jeff' )
   scp.download!( '/home/test/zt.csv', 'd:/' )
end