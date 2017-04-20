
class StringUtils
  # 转换时间格式   %Y%m%d%H%M%S
   def getstrftime()
       time = Time.new
       return time.strftime("%Y%m%d%H%M%S")
   end
end