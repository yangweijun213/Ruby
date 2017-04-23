# 读写CSV, http://www.dlxedu.com/detail/22/477180.html 
# http://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html
require 'CSV'

#一次读入全部文件：
arr_of_arrs = CSV.read("ruby233/16_WriteReadCSV/data.csv")
puts arr_of_arrs

puts "===================================================="
#一次读入全部文件后，可以再用each方法逐行处理：
CSV.open("ruby233/16_WriteReadCSV/data.csv", "rb").each do |row|
  puts row
end