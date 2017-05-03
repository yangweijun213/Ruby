#############################################################
# 定义page对象封装 #
# 登录注销 #
#############################################################
require 'rubygems'
require 'watir-classic'  #watir和watir-classic不能同时存在

#加载默认路径引入公共类
require File.expand_path('../../page/loginlogout/Login',__FILE__)
require File.expand_path('../../page/loginlogout/Logout',__FILE__)

class SysLoginLogout
  
  def initialize (browser)
    @browser = browser
  end
    
  #登录系统
  #入参:用户名,密码
  def login (username,password)
    colSys_login_btn.wait_until_present($waitTime)
    colSys_login_usr_field.set(username)
    colSys_login_pwd_field.set(password)
    #等待密码输完,再进行下一步
    break while password ==  colSys_login_pwd_field.value
    colSys_login_btn.click
  end
  
  #判断是否登录成功
  def login_success_assert
    #assert(colSys_logout_btn.when_present($waitTime).exist?,"登录失败，未跳转到home page")
    boolean = @browser.text.include? "Home"
    return boolean
  end
  
  #如果Session already exists,登陆系统
  def login_session_already_exists
    if  login_session_already_exists_title == "Session already exists"
      login_session_already_exists_continue_btn.click
    end
  end
  
  #注销
  def logout
    colSys_logout_btn.click
  end

end