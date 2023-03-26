## pluckメソッドについて 
<br>

- pluckメソッド  
```
指定したカラムの値を取り出すメソッド。
ActiveRecordに対してクエリを発行し、その結果を指定したカラムの値の配列として返す。

selectメソッドやmapメソッドを使ってカラムの値を取り出すこともできるが、pluckメソッドを使う方が簡潔で効率的な場合がある。
```
<br>
<br>

- 例1  
```rb
User.pluck(:name) 
#=> ["Alice", "Bob", "Charlie", ...]
```
<br>
<br>

- 例2  
```rb
#複数のカラムの指定もできる
User.pluck(:id, :name) 
#=> [[1, "Alice"], [2, "Bob"], [3, "Charlie"], ...]
```