require 'oci8'

class JDBCUtils
  
  def connection_oralce 
  end
  conn = OCI8.new("SINGLEUSERPERFORMANCETEST", "creditderivative","172.20.20.35:1521/ora11g")
  cursor=conn.exec('select * from DIM_TEST_RUN') do |r| puts r.join(',')
  end
end