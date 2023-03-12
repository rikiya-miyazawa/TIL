## collectメソッドについて 
<br>

- collectメソッド 
```
配列やハッシュなどのコレクションオブジェクトの要素を変換するためのメソッド。

引数としてブロックを受け取る。
このブロックは、配列の各要素を引数として受け取り、その要素を変換して返す処理を記述する。
collect メソッドは、ブロックが返した値を集めた新しい配列を返す。

mapメソッドと同じ働きをする。
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