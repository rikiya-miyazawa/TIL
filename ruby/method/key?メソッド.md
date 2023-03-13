## key?メソッドについて 
<br>

- key?メソッド  
```
Rubyのハッシュオブジェクトにおいて、指定したキーが存在するかどうかを調べるためのメソッド。

hash.key?(key)

引数には検索したいキーを指定す。
指定されたキーが存在する場合は、trueを返す。
もし、指定されたキーが存在しない場合は、falseを返す。

key?メソッドは、ハッシュのhas_key?メソッドと同じ意味を持つ。
ただし、key?メソッドの方が一般的に使われることが多い。
```
<br>
<br>

- 例  
```rb
person = {name: "Alice", age: 30, email: "alice@example.com"}
person.key?(:name)    
#=> true
person.key?(:gender)  
#=> false
```
<br>
<br>

- value?メソッド  
```rb
#key?のvalueバージョン
person = {name: "Alice", age: 30, email: "alice@example.com"}
person.value?(30)    
#=> true
person.value?(:31)  
#=> false
```