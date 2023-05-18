## exists?メソッド  
<br>

- exists?メソッド  
```rb
#指定した条件のレコードがDBに存在するかどうかを真偽値で返すメソッド
Event.where(id: 1).exists?
#=> true
```