#重写基类
class Father
  def says()
    puts "I am father"
  end
  
  def says2 (name)
    puts "I am #{name}"
  end
  
  def fatherInfo()
    puts "father info"
  end
end

class Son < Father
  def says()
    puts "I am son."
    puts "I am son2"
  end
  
  def says2(name,age)
    puts "I am #{name},#{age}"
  end
  
  def sonInfo()
    puts "son info"
  end
end

father = Father.new
son = Son.new

father.says()
father.says2("Tom")
father.fatherInfo()

son.says()
son.says2("Mike","50")
son.sonInfo()
son.fatherInfo()

