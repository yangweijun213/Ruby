# 解析XML文件  
# ref: http://www.runoob.com/ruby/ruby-xml-xslt-xpath.html

require 'rexml/document'
include REXML
 
xmlfile = File.new("./ruby233/08_XML/movies.xml") #默认是在项目RubyTest下
xmldoc = Document.new(xmlfile)
 
# 获取 root 元素
root = xmldoc.root
puts "Root element : " + root.attributes["shelf"]
 
# 以下将输出电影标题
xmldoc.elements.each("collection/movie"){ 
   |e| puts "Movie Title : " + e.attributes["title"] 
}
 
# 以下将输出所有电影类型
xmldoc.elements.each("collection/movie/type") {
   |e| puts "Movie Type : " + e.text 
}
 
# 以下将输出所有电影描述
xmldoc.elements.each("collection/movie/description") {
   |e| puts "Movie Description : " + e.text
}

puts  xmldoc.root.name #输出跟节点名
chapter1 = xmldoc.root.elements[1] #输出节点中的子节点
puts  chapter1.attributes['title']  #输出第一个节点的title属性值
puts  chapter1.text #输出第一个节点的包含文本