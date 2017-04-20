# Admin login page and search agreement by id

require 'rubygems'
require File.expand_path('../../module/AgreementSearchBehaviour',__FILE__) 

class Admin
  
  def initialize (browser,url,uname,pwd)
    @browser = browser
    @url = url
    @uname = uname
    @pwd = pwd
  end
  
  include AgreementSearchBehaviour
  
end