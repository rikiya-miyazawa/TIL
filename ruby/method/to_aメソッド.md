## to_aメソッドについて 
<br>

- to_aメソッド  
```
オブジェクトを配列に変換するメソッド。

以下のようなオブジェクトを配列に変換することができる。

Rangeオブジェクト
Hashオブジェクト
Setオブジェクト
Enumeratorオブジェクト
その他のオブジェクト
```
<br>
<br>

- 例  
```rb
range = 1..5
array = range.to_a
# => [1, 2, 3, 4, 5]

hash = {a: 1, b: 2, c: 3}
array = hash.to_a
# => [[:a, 1], [:b, 2], [:c, 3]]
```