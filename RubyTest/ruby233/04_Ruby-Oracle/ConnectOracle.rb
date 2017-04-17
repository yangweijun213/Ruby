# 使用rubby-oci8 www.rubydoc.info/gems/ruby-oci8/2.2.2
# ruby-oci8 is a ruby interface for Oracle using OCI8 API. It is available with Oracle 10g or later including Oracle Instant Client.
# gem install ruby-oci8

require 'oci8'

#def open_connection
#    tnsnames = '(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = 172.20.20.35)(PORT = 1521)) (CONNECT_DATA = (SID = ora11g)))'
#    connection = OCI8.new('SINGLEUSERPERFORMANCETEST', 'creditderivative', tnsnames)
#end

conn = OCI8.new("SINGLEUSERPERFORMANCETEST", "creditderivative","172.20.20.35:1521/ora11g")
cursor=conn.exec('select * from DIM_TEST_RUN') do |r| puts r.join(',')
end