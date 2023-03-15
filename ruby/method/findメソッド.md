## findメソッドについて 
<br>

- findメソッド  
```
配列やハッシュの要素から特定の値を見つけるために使用される。
具体的には、ブロック内の条件を満たす最初の要素を返す。

array_or_hash.find {|element| block}

条件を満たす要素が見つからなかった場合はnilが返される。
```
<br>
<br>

- 例1  
```rb
numbers = [1, 2, 3, 4, 5]
result = numbers.find {|n| n == 3 }
puts result
# => 3
```
<br>
<br>

- 例2  
```rb
#条件を満たす要素が見つからなかった場合はnilが返る。
numbers = [1, 2, 3, 4, 5]
result = numbers.find {|n| n == 6 }
puts result 
# => nil
```