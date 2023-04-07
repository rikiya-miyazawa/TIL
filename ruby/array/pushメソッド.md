## pushメソッド  
<br>

- <<と同じく配列の末尾に要素を追加(複数可)するメソッド  
```rb
#<<は要素一つだけだが、pushは複数の要素を追加できる
names = ["tanaka", "nakamura", "satou"]
names.push("suzuki", "watanabe")  #複数の要素を追加できる #配列の末尾に追加される 
p names
#=> ["tanaka", "nakamura", "satou", "suzuki", "watanabe"]
```