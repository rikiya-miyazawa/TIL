## detectメソッドについて 
<br>

- detectメソッド 
```
detectメソッドは、ある条件を満たす最初の要素を返す。
配列を対象にした場合、ブロック内の条件式が最初にtrueを返した要素を返す。
条件を満たす要素が複数ある場合でも、最初に見つかった要素のみを返す。

また、detectメソッドは、findメソッドと同じ機能を持つ。
```
<br>
<br>

- 例  
```rb
arr = [1, 2, 3, 4, 5]
result = arr.detect { |n| n > 3 }
puts result
#=> 4

result = arr.detect { |n| n > 5 }
puts result
#=> nil
```