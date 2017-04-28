#负责查询（对外提供服务的核心类）
class Query
  
  #直接执行一个DML语句
  #参数：sql语句，conn连接参数
  def executeDML (conn,sql)
    
  end
  
  #删除数据
  #参数：sql语句，conn连接参数
  def delete (conn,sql)
  end
  
  #更新对应记录
  #参数：sql语句，conn连接参数
  def update (conn,sql)
  end
  
  #查询返回多行记录
  #参数：sql语句，conn连接参数
  def queryRows (conn,sql)
  end
  
  #查询返回一行记录
  #参数：sql语句，conn连接参数
  def queryUniqueRow (conn,sql)
  end

end