#派生类可以直接调用基类的构造方法

class Father  
  def initialize name  
    @name = name  
  end  
  
  def says  
    puts "I am father."  
  end  
end  
  
class Son < Father  
  def says  
    puts "I am son. name: #{@name}"  
  end  
end  
  
son = Son.new "Tom"  
  
son.says  