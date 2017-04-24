
#Ruby 方法
def test(a1="Ruby", a2="Perl")
   puts "编程语言为 #{a1}"
   puts "编程语言为 #{a2}"
end
test "C", "C++"
test

#Ruby return 语句
def test2()
  i=100
  return i
end
var = test2
puts var