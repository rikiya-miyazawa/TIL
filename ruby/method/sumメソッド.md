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
```
