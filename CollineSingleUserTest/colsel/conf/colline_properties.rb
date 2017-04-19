#################################################################################
# 1 - This properties file is intend to hold all the configurable parameters. ###
# 2 - Please change them before start automation test                         ###
#                                                                             ###
#################################################################################

###Colline System###
#Colline system url#
$colline_url= "http://54.193.33.252:8080/colline/"
#Colline system username#
$colline_username = "sa4"
#Colline system password#
$colline_password = "password"

####Colline Database Connection###
#the user name to login to database
$colline_database_user = "changeit"
#clear password for above user to login to database
$colline_database_password = "changeit"
#Database schema name
$colline_database_schema = "changeit"
#Colline database jdbc url, which constructed by database server address,server port,instance.
#Support both Oracle and SQLServer, For Oracle, support to use SID, ServiceName, TNS String.
#colline.database.jdbc.url=jdbc:oracle:thin:@//${Database Server Address}:${Server Port}/${ServiceName}
#colline.database.jdbc.url=jdbc:oracle:thin:@${Database Server Address}:${Server Port}:${Instance}
#colline.database.jdbc.url=jdbc:oracle:thin:@(DESCRIPTION =(ADDRESS = (PROTOCOL = TCP)(HOST = ${Database Server Address})(PORT = ${Server Port}))(CONNECT_DATA =(SERVER = DEDICATED)(ORACLE_SID = ${Instance})))
#colline.database.jdbc.url=jdbc:jtds:sqlserver://${Database Server Address}:${Server Port}/${SCHEMA};instance=${Instance}
$colline_database_jdbc_url= "changeit"

###HttpWatch Configuration###
#define httpwatch csv report field#
$httpwatch_fieldList = "Started, Page Title, Page ID, Device Name, User Name, Time, Sent, Received, Method, Result, Type, URL, Render Start, DOM Load, HTTP Load, Page Load, Network, Cache Read"
#httpwatch report location#
$httpWatch_report = "D:\\workspace\\Automation_PST\\Automation\\Ruby_Watir_HttpWatch\\CollineSingleUserTest\\colsel\\log"

###Automation Configuration###
#Automation Server Address#
$auto_server_ip
#log location#
$auto_log = "D:\\workspace\\Automation_PST\\Automation\\Ruby_Watir_HttpWatch\\CollineSingleUserTest\\colsel\\log"
#Screenshot location
$auto_screenshot = "D:\\workspace\\Automation_PST\\Automation\\Ruby_Watir_HttpWatch\\CollineSingleUserTest\\colsel\\log"
#Test data location#
$auto_data = "changit"

###Colline Server Connection###
$colline_server_ip = "changit"

###Colline log Collection###
$colline_server_log = "changit"

###Database report collection###
$colline_awr_report = "changeit"
$colline_ash_report = "changeit"
