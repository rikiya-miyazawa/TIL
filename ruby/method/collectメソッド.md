## collectメソッドについて 
<br>

- collect/mapメソッド 
```
配列やハッシュなどのコレクションオブジェクトの要素を変換するためのメソッド。

引数としてブロックを受け取る。
このブロックは、配列の各要素を引数として受け取り、その要素を変換して返す処理を記述する。
collect メソッドは、ブロックが返した値を集めた新しい配列を返す。
mapメソッドと同じ働きをする。
ブロックの戻り値が配列の要素となる新しい配列が作成される。
空の配列を用意して、他の配列をループ処理した結果を空の配列に詰め込んでいくような処理の大半はmapメソッドに置き換えられる。
```
<br>
<br>

- 例  
```rb
numbers = [1, 2, 3, 4, 5]
doubled_numbers = numbers.collect { |n| n * 2 }
puts doubled_numbers.inspect #=> [2, 4, 6, 8, 10]
```
<br>
<br>

- collect!メソッド 
```
結果を上書き保存する。
```
<br>
<br>

- 例  
```
irb(main):006:0> id.collect {|n| n * 2}
=> [2, 4, 6, 8, 10]
irb(main):007:0> id
=> [1, 2, 3, 4, 5]
irb(main):008:0> id.collect! {|n| n * 2}
=> [2, 4, 6, 8, 10]
irb(main):009:0> id
=> [2, 4, 6, 8, 10]
```
<br>
<br>

- 配列の各要素を10倍にして、その結果を要素とした新しい配列を作成する  
```rb
#mapメソッドなし
numbers = [1, 2, 3, 4, 5]
new_numbers = []
numbers.each { |n| new_numbers << n * 10}
new_numbers  #=> [10, 20, 30, 40, 50]

#mapメソッドを活用
numbers = [1, 2, 3, 4, 5]
new_numbers = numbers.map { |n| n * 10 }
new_numbers  #=> [10, 20, 30, 40, 50]
```