## 論理演算子OR || について 
<br>

- 論理演算子OR ||  
```
左側の式が false または nil の場合に、右側の式を評価する。
```
<br>
<br>

- 例1  
```rb
ope = "wakuwaku" == "waku" * 2 || "Rubyは楽しい"
puts ope
#=> true
#左側の式が正しいのでtrue
```
<br>

- 例2  
```
ope = "wakuwaku" == "waku" * 3 || "Rubyは楽しい"
=> "Rubyは楽しい"
irb(main):002:0> puts ope
Rubyは楽しい
#||の左側がfalseなので右側が代入される。
```
