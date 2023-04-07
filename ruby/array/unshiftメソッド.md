## unshiftメソッド  
<br>

- 配列の先頭に要素を追加する  
```rb
names = ["tanaka", "nakamura", "satou"]
names.unshift("kobayasi", "isikawa")  #複数の要素を追加できる #配列の先頭に追加される 
p names
#=> ["kobayasi", "isikawa", "tanaka", "nakamura", "satou"]
```