## sprintfメソッドについて 
<br>

- sprintfメソッド  
```
指定されたフォーマットに従って、引数で渡されたデータを文字列に変換する。
```
<br>
<br>

```rb
#2進数に変換 先頭に"0b"がつく
p sprintf("%#b", 20)
#=> "0b10100"

#8進数に変換 先頭に"0"がつく
p sprintf("%#o", 20)
#=> "024"

#16進数に変換 先頭に"0x"がつく
p sprintf("%#x", 20)
#=> "0x14"
```