# 读CSV-表格结构来插入 
# http://stackoverflow.com/questions/15598658/ruby-write-in-csv-file-by-columns-from-arrays

require 'CSV'

array1 = Array.new
array2 = Array.new
array3 = Array.new
array1 = ["AA", "BB", "CC"] 
array2 = ["AA2", "BB2", "CC2"] 
array3 = ["AA3", "BB3", "CC3"] 

file="ruby233/16_WriteReadCSV/data.csv" #默认是项目的根目录

# 表格结构来插入 - 颠倒 第一列全是行
#table = [array1,array2,array3].transpose
#CSV.open(file, 'ab') do |csv|
#    table.each do |row|
#        csv << row
#    end
#end
# 表格结构来插入 - 不颠倒 
table = [array1,array2,array3]
CSV.open(file, 'ab') do |csv|
    table.each do |row|
        csv << row
    end
end
