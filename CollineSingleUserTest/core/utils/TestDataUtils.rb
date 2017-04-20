require 'win32ole'
require 'rexml/document'


class TestDataUtils
  #解析excel
  def getExcelData(excelpath)
     excel = WIN32OLE.new('Excel.Application')
     excel.visible = true
     workbook = excel.Workbooks.Open('#{excelpath}')
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
   
   #解析xml
   def getXMLData (root,element,subelement,xmlpath)
     
     include REXML
     xmlfile = File.new("xmlpath") #默认是在项目RubyTest下
     xmldoc = Document.new(xmlfile)
  
     xmldoc.elements.each("#{root}/#{element}/#{subelement}") {
        |e| return e
     }
   end
    
end