#负责Oracle查询
class OracleQuery < Query
  
  #重写方法
  #查询返回多行记录
  #参数：sql语句，conn连接参数
  def queryRows (conn,sql)
    list=Array.new
    cursor=conn.exec('#{sql}') do |r| list.push(r)
    end
    return list
  end
  
end