## each_lineメソッドについて 
<br>

- each_lineメソッド 
```
文字列を行単位で分割して各行を順番に処理するためのメソッド
```
<br>
<br>

- 例1  
```rb
text = "line1\nline2\nline3\n"
text.each_line do |line|
  puts line
end
#=> line1
#=> line2
#=> line3
```
<br>
<br>

- 例2  
```rb
#同じ結果になる
text = "line1\nline2\nline3\n"
text.each_line { |line| puts line }
#=> line1
#=> line2
#=> line3
```