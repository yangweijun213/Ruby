require 'rubygems'
require 'watir-classic'  #watir和watir-classic不能同时存在

#加载默认路径引入公共类
require File.expand_path('../../colbiz/login',__FILE__) 

#login
Login.new("OpenPage").start()
Login.new("OpenPage").openPage()
Login.new("ClickLogin").login()