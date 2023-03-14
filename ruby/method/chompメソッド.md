## chompメソッドについて 
<br>

- chompメソッド  
```
文字列の末尾にある改行コード（\n）を取り除くために使用される。
改行コードがある場合は、改行コードを取り除いた新しい文字列を返す。
改行コードがない場合は、元の文字列をそのまま返す。
```
<br>
<br>

- 例1  
```rb
string = "Hello World\n"
result = string.chomp
puts result 
# => "Hello World"
```