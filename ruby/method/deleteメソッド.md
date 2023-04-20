## deleteメソッド  
<br>

- deleteメソッド  
`文字列の中から引数に指定した文字を削除することができる`  
<br>

```rb
str = "ABCD1234"
puts str.delete("AC14")
#=> BD23

#範囲指定もできる
#delete! メソッドは新しい文字列を返すのではなく、元の文字列から文字を削除する
str = "abcdefghi123456789"
str.delete!("c-g3-7")
puts str
#=> abhi1289
```