# 解析XML文件  
# http://blog.csdn.net/leaf1984zh/article/details/5652728
  
require "rexml/document"  
include REXML  
puts "-- BEGIN --"  
doc = Document.new(File.open("./ruby233/08_XML/TestXML.xml"))  #默认是在项目RubyTest下
#doc.elements.each('BoardComposant') do |elem|  
#  cr_ele = elem.get_elements('ComponantRectangle')  
#  puts cr_ele  
#end  
doc.elements.each("BoardComposant/ComponantRectangle"){  |elem|  
  if "second" == elem.attributes["name"]  then  
    puts " => 2th"  
    puts elem.elements[2].elements["Height"].text  
    elem.elements.each{ |e|  
      puts e.elements["Height"].text    
    }  
  end  
}  
#----------------------------------------------  
puts "-----------------------------------------"  
#----------------------------------------------  
input = File.new("./ruby233/08_XML/book.xml")  
doc = Document.new(input)  
  
root = doc.root  
puts root.attributes["shelf"]          #　Recent　Acquisitions　  
  
doc.elements.each("library/section") { |e| puts e.attributes["name"] }  
#  Output:　  
#    Ruby　  
#    Space　  
  
doc.elements.each("*/section/book") { |e| puts e.attributes["isbn"] }  
#　Output:　  
#　　0672328844　  
#　　0321445619　  
#　　0684835509　  
#　　074325631X　  
  
sec2 = root.elements[2]  
author = sec2.elements[1].elements["author"].text         #　Robert　Zubrin  
puts author  
puts "-- End --"  