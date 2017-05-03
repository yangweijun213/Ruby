#################################################################################
# 1 - This  file is intend to hold all the configurable parameters. ###
# 2 - Please change them before start automation test                         ###
#                                                                             ###
#################################################################################

#=========================Common========================#

#调试日志输出开关：空为连跑，非空(1)为单个脚本调试
$debugLog ='1'
#测试浏览器
$testBrowser = Watir::IE.new
#系统版本号
$colSysVersionNum = "15.0.0.0"
#获取当前时间
$curr_time = Time.now.strftime("%Y%m%d%H%M%S")
#工程项目

#Colline system url#
$colUrl= "http://172.20.20.90:8080/colline/"
#Colline system username#
$colUsrName = "sa"
#Colline system password#
$colPwd = "password"
#等待元素出现的超时时间
$waitTime = 10
#等待加载
$sleepTime = 2

#=========================Test Server================#

#测试主机地址#
$testHostIP = "172.20.20.90"
#测试主机名
$testHostName = "172.20.20.90"
#测试主机密码
$testHostPwd = "password"
#测试报告标题
$testReportTitile ="AutoTestResults(#{Time.now.strftime("%m%d%H%M")})"
#测试报告名
$testReportName ="AutoTestResults_#{Time.now.strftime("%m%d%H%M")}.html"
#测试报告目录
$testReportDir = "D:\\workspace\\Ruby\\ColSingleUserTest\\col\\result\\testreport"
#测试日至
$testLog = 'D:\\workspace\\Ruby\\ColSingleUserTest\\col\\result\\log\\auto.log'
#Screenshot
$testScreenshot = 'D:\\workspace\\Ruby\\ColSingleUserTest\\col\\result\\screenshot'
#httpwatch结果
$httpwatch_result = 'D:\\workspace\\Ruby\\ColSingleUserTest\\col\\result\\httpwatch_result'
#define httpwatch csv report field#
$httpwatch_fieldList = "Started, Page Title, Page ID, Device Name, User Name, Time, Sent, Received, Method, Result, Type, URL, Render Start, DOM Load, HTTP Load, Page Load, Network, Cache Read"

#=========================Colline App Server================#
#应用服务器的主机IP
$colline_server_hostIP = "changit"
#应用服务器的主机名
$colline_server_hostName = "changit"
#应用服务器的主机密码
$colline_server_hostPwd = "changit"
#应用服务器的日志
$colline_server_log = "changit"
#应用服务器的threaddump
$colline_server_theadDump = "changit"
#应用服务器的gc日志
$colline_server_gc = "changit"

#=========================Colline Database Server================#
#数据库类型 (Oracle,SqlServer)
$database_type = "Oracle"
#the user name to login to database
$database_user = "changeit"
#clear password for above user to login to database
$database_password = "changeit"
#Database schema name
$database_schema = "changeit"
#Colline database jdbc url, which constructed by database server address,server port,instance.
#Support both Oracle and SQLServer, For Oracle, support to use SID, ServiceName, TNS String.
#colline.database.jdbc.url=jdbc:oracle:thin:@//${Database Server Address}:${Server Port}/${ServiceName}
#colline.database.jdbc.url=jdbc:oracle:thin:@${Database Server Address}:${Server Port}:${Instance}
#colline.database.jdbc.url=jdbc:oracle:thin:@(DESCRIPTION =(ADDRESS = (PROTOCOL = TCP)(HOST = ${Database Server Address})(PORT = ${Server Port}))(CONNECT_DATA =(SERVER = DEDICATED)(ORACLE_SID = ${Instance})))
#colline.database.jdbc.url=jdbc:jtds:sqlserver://${Database Server Address}:${Server Port}/${SCHEMA};instance=${Instance}
$database_jdbc_url= "changeit"
$awr_report = "changeit"
$ash_report = "changeit"