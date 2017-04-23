require 'rubygems'    

#加载默认路径引入公共类
require File.expand_path('../../conf/Properties',__FILE__) 
require File.expand_path('../../page/login/Login',__FILE__) 
require File.expand_path('../../page/collateral/AgreementSearchCriteria',__FILE__) 

module SearchAgreementById
  
  # test initial
  def test_initial
    @login_page = Login.new(@browser,@url,@uname,@pwd)
    @agreement_search_page = AgreementSearchCriteria.new(@browser)
    @login_page.start()
  end
  
  #open colline
  def visit_openpage(transaction_name,checkpoint)
    @login_page.open_page(transaction_name,checkpoint)
  end
  
  #login colline
  def visit_login(transaction_name,checkpoint)
    @login_page.login(transaction_name,checkpoint)
  end
  
  #goto agreement search page
  def visit_goto_agreement_search_page(transaction_name,checkpoint)
    @agreement_search_page.goto_agreement_search(transaction_name,checkpoint)
  end
  
  def visit_search_agreement_by_id(transaction_name,checkpoint,systemid)
    @agreement_search_page.agreement_search_by_system_id(transaction_name,checkpoint,systemid)
  end
end