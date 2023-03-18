## each_with_indexメソッドについて 
<br>

- each_with_indexメソッド 
```
each_with_index メソッドは、配列の要素を順番に取り出しながら、その要素のインデックスも同時に取得することができるメソッド。
```
<br>
<br>

- 例  
```rb
member = ["kikuchi", "maeda", "tanaka"]
member.each_with_index do |x, y|
 print "#{x} #{y} "
end
#=> kikuchi 0 maeda 1 tanaka 2

member.each_with_index { |x, y| print "#{x} #{y} " }
#=> kikuchi 0 maeda 1 tanaka 2
```