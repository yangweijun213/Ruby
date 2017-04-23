# 读CSV, http://www.dlxedu.com/detail/22/477180.html
# http://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html
require 'CSV'

# 写入CSV
CSV.open("ruby233/16_WriteReadCSV/data.csv", "wb") do |csv|
  csv << ["row", "of", "CSV", "data"]
  csv << ["another", "row"]
end
