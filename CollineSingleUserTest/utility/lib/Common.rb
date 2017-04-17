require 'win32ole'

class Common
  
  # 转换时间格式   %Y%m%d%H%M%S
  def getStrftime()
      time = Time.new
      return time.strftime("%Y%m%d%H%M%S")
  end
  
  def getExcelData()
     excel = WIN32OLE.new('Excel.Application')
     excel.visible = true
     workbook = excel.Workbooks.Open('D:\workspace\Automation_PST\Automation\Ruby_Watir_HttpWatch\CollineSingleUserTest\colbiz\TestData\Login.xlsx')
     worksheet = workbook.Worksheets(1) #定位到第一个sheet
     worksheet.Select
     
     line= 2
     data = Array.new
     while worksheet.Range("A#{line}").value  #如果有值,就返回true
         data << worksheet.Range("A#{line}").value #存到数组中 
         data << worksheet.Range("B#{line}").value #存到数组中 
         data << worksheet.Range("C#{line}").value #存到数组中 
         data << worksheet.Range("D#{line}").value #存到数组中 
         data << worksheet.Range("E#{line}").value #存到数组中 
         line = line + 1
     end
     excel.Quit
     
     return data
   end
    
end