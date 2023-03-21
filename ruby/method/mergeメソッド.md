## mergeメソッドについて 
<br>

- mergeメソッド 
```
2つのハッシュを結合するためのメソッドです。結合後のハッシュは、元のハッシュを変更するのではなく、新しいハッシュを返す。
```
<br>
<br>

- 例1  
```rb
#2つのハッシュが統合されたハッシュが返ってくる
hash1 = {a: 100, b: 200}
hash2 = {c: 300, d: 400}
merged_hash = hash1.merge(hash2)
p merged_hash 
#=> {a: 100, b: 200, c: 300, d: 400}
```
<br>
<br>

- 例2  
```rb
#重複しているキーがあると後から渡された値が優先される
#bが重複
hash1 = {a: 100, b: 200}
hash2 = {b: 300, c: 400}
merged_hash = hash1.merge(hash2)
p merged_hash 
#=> {a: 100, b: 300, c: 400}
```
