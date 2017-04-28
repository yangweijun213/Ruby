#Linux 相关操作的工具类
require 'net/ssh'
require 'net/scp'

class LinuxUtils
  #执行linux shell
  #参数：host主机名，user 用户名，pwd密码, shell脚本
  def execute_shell(host,user,pwd,shell_script)
    Net::SSH.start( host, user, :password => pwd ) do |ssh|
      result = ssh.exec!"#{shell_script}"
    end
  end

  #从Linux下载文件到window
  #参数：host主机名，user 用户名，pwd密码, source_file Linux上文件的位置，windows上的位置
  def download_file_from_linux (host,user,pwd,linux_file,windows_folder)
    Net::SCP.start( host, user, :password => pwd ) do |scp|
      scp.download!( '#{linux_file}', '#{windows_folder}' )
    end
  end

  #从windows上传文件到 Linux
  #参数：host主机名，user 用户名，pwd密码, source_file windows上的位置文件，Linux上文件的位置，
  def upload_file_to_linux (host,user,pwd,windows_file,linux_folder)
    Net::SCP.start( host, user, :password => pwd ) do |scp|
      scp.upload!( '#{windows_file}', '#{linux_folder}' )
    end
  end

  #从windows上传文件夹和子文件夹到Linux
  #参数：host主机名，user 用户名，pwd密码, source_file Linux上文件的位置，windows上的位置
  def download_file_from_linux (host,user,pwd,linux_folder,windows_folder)
    Net::SCP.start( host, user, :password => pwd ) do |scp|
      scp.download!( '#{linux_file}', '#{windows_folder}',:recursive => true )
    end
  end

  #从Linux上下载文件夹和子文件夹到windows
  def upload_file_to_linux (host,user,pwd,windows_folder,linux_folder)
    Net::SCP.start( host, user, :password => pwd ) do |scp|
      scp.upload!( '#{windows_file}', '#{linux_folder}',:recursive => true)
    end
  end
end