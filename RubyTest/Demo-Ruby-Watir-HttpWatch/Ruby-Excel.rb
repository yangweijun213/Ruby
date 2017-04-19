require 'win32ole'

excel = WIN32OLE.new('Excel.Application')
excel.visible = true
workbook = excel.Workbooks.Open('D:\\workspace\\Automation_PST\\Automation\\Ruby_Watir_HttpWatch\\CollineSingleUserTest\\TestData.xlsx')
worksheet = workbook.Worksheets(1) #定位到第一个sheet
worksheet.Select

line= 1
data = Array.new
while worksheet.Range("a#{line}").value  #如果有值,就返回true
    puts worksheet.Range("a#{line}:b#{line}").value #输出每行的第一列和第二列数据
    data << worksheet.Range("a#{line}:b#{line}").value #存到数组中 
    puts data[0] #打印数组第一列和第二列数据 
    line = line + 1
end
excel.Quit