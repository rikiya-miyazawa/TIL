## include?メソッドについて 
<br>

- include?メソッド  
```
Rubyの配列や範囲（Range）オブジェクトに対して、指定された要素が含まれるかどうかを調べるためのメソッド.

array.include?(obj)

引数には、調べたい要素を指定する。
指定された要素が配列に含まれている場合は、trueを返す。
もし、含まれていない場合は、falseを返す。
```
<br>
<br>

- 例  
```rb
fruits = ["apple", "banana", "orange"]
fruits.include?("apple")   
#=> true
fruits.include?("melon")   
#=> false

#範囲オブジェクト
range = 1..10
range.include?(5)   
#=> true
range.include?(15)  
#=> false

#ハッシュ
person = {name: "Alice", age: 30, email: "alice@example.com"}
person.include?(:name)
#=> true
person.include?("name")
#=> false
person.include?(:names)
#=> false
```