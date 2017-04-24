# Ruby class使用
class DateTimeClass
    
  def getTimeStamp()
    time = Time.new
    return time.strftime("%Y%m%d%H%M%S")
  end
  
end

test = DateTimeClass.new()
puts test.getTimeStamp()

#错误
#puts getTimeStamp()