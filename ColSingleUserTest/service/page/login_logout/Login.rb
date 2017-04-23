############################################################################
#   主要为被测系统的元素集合，一个元素一个方法  #
#   登陆元素   #
############################################################################
require 'rubygems'
require 'watir-classic'  #watir和watir-classic不能同时存在

class Login 
  #系统主页登陆地址
  #元素名："url地址"
  def colSys_open_url
    #open page
    $browser.goto("#{$colUrl}")
  end

  #系统登陆框
  #元素名："用户输入框"
  def colSys_login_field
    $browser.text_field(:name, "j_username").set "#{$uname}"
  end
  
  #系统密码框
  #元素名："密码输入框"
  def colSys_login_pwd
    $browser.text_field(:name, "j_password").set "#{$pwd}"
  end
    
  #系统登录按钮
  #元素名："登录"
  def colSys_login_btn
    $browser.button(:name, "submit").click
  end
  
  #系统输入正确账号和密码,Session already exists返回信息
  #元素名："页面标题"
  def login_session_already_exists_title
    $browser.title == "Session already exists"
  end
    
  #系统输入正确账号和密码，提示Session already exists，继续登陆按钮
  #元素名："继续登陆"
  def login_session_already_exists_continue_btn
      $browser.button(:name, "continue").click
  end

  #系统输入错误账号或密码的返回信息
  def login_error_accpwd_errCode
  end
  
  #系统空账号或空密码登录失败的返回信息
  def login_null_accpwd_errCode
  end
end

