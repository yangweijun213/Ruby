# 用于测试service login.rb, AgreementSearchCriteria.rb

require 'rubygems'
require 'watir-classic'  

#加载默认路径引入公共类
require File.expand_path('../../conf/Properties',__FILE__) 
require File.expand_path('../../../service/page/login/Login',__FILE__) 
require File.expand_path('../../../service/page/collateral/ColAgreementDetailsSearchAgreement',__FILE__) 

#实例化 browser
browser= Watir::IE.new
login_page = Login.new(browser,"http://172.20.20.90:8080/colline","sa","password")
login_page.start()
login_page.open_page("open page","login")
login_page.login("login","Home")

colagreement_detail_agreement_search = AgreementSearchCriteria.new(browser)
colagreement_detail_agreement_search.goto_agreement_search("goto agreement search page","Collateral - Agreement Search")
colagreement_detail_agreement_search.agreement_search_by_system_id("agreement_search_by_system_id","Agreementid:12101","12101")
