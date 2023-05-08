## sumメソッド  
<br>

- sumメソッド  
```rb
#要素の合計を求める
numbers = [1, 2, 3, 4]
numbers.sum  #=> 10

new_numbers = numbers.sum { |n| n * 5 }
new_numbers  #=> 50
```