## sumメソッド  
<br>

- sumメソッド  
```rb
#要素の合計を求める
numbers = [1, 2, 3, 4]
numbers.sum  #=> 10

#nを5倍して順に足していく
new_numbers = numbers.sum { |n| n * 5 }
new_numbers  #=> 50

#引数で初期値を渡すこともできる
numbers = [1, 2, 3, 4]
numbers.sum(5)  #=> 15  引数の5 + 配列numbersの合計値

#文字列の連結もできる
chars = ['a', 'b', 'c']
chars.sum('')  #=> "abc"

#joinメソッドを使うこともできる
chars = ['a', 'b', 'c']
chars.join  #=> "abc"

#引数に区切り文字を指定できる
#ハイフンで区切る
chars = ['a', 'b', 'c']
chars.join('-')  #=> "a-b-c"

#数値が含まれていても暗黙的にto_sメソッドで変換されるから連結できる
data = ['a', 2, 'b', 3, 'c']
data.join  #=> "a2b3c"


```
