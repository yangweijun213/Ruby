# CSV文件的读写操作
require 'CSV'

#方法：添加数据到CSV文件 - 行插入
def write_csv (csvfile,array)
  table = [array1]
  CSV.open(csvfile, 'ab') do |csv|
    table.each do |row|
      csv << row
    end
  end
end

#方法：添加数据到CSV文件 - 一次插入 (将插入的数组数据，在存储到table数组里面)
def write_csv (csvfile,table) #table = [array1,array2,array3]
  CSV.open(csvfile, 'ab') do |csv|
    table.each do |row|
      csv << row
    end
  end
end
