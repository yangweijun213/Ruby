#DBManager
#根据配置信息,Oracle连接管理

require 'oci8'

class DBManager
  
  # 获得Oracle连接
  # 参数：用户名 (SINGLEUSERPERFORMANCETEST)，密码(creditderivative)，url(172.20.20.35:1521/ora11g)
  def get_oracleconn(username,password,url)
    conn = OCI8.new(username, password,url)
    return conn
  end
  
  # 关闭Oracle连接
  def close_oracleconn
  end
  
end
