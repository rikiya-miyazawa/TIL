## selectメソッドについて 
<br>

- select/find_allメソッド 
```
配列やハッシュなどの要素から条件に合致するものだけを抽出して新しい配列を作成するメソッド。
find_allがエイリアスメソッド。
ブロックを評価して、値が真の要素だけを返すメソッド
rejectメソッドは反対に偽の要素だけを返すメソッド
```
<br>
<br>

- 例  
```rb
array = [1, 2, 3, 4, 5]
array.select { |item| item.even? }
#=> [2,4]
#selectで条件に合致するものだけを抽出して新しい配列を作成する
#ブロックでitemに配列の値を代入
#even?メソッド偶数の値だけを取得する
```
<br>
<br>

- select!  
```
元の配列から条件に合致する要素だけを残して、それ以外の要素を削除する。
```
<br>
<br>

- 例  
```
irb(main):001:0> array = [1, 2, 3, 4, 5]
=> [1, 2, 3, 4, 5]
irb(main):002:0> array.select { |item| item.even? }
=> [2, 4]
irb(main):003:0> array
=> [1, 2, 3, 4, 5]
irb(main):004:0> array.select! { |item| item.even? }
=> [2, 4]
irb(main):005:0> array
=> [2, 4]
```
