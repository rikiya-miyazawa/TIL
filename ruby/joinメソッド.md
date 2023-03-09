## joinメソッドについて 
<br>

- joinメソッド 
```
Rubyの配列オブジェクトのインスタンスメソッドで、配列内の要素を指定した区切り文字で連結して一つの文字列にする。
```
<br>
<br>

- 例1  
```rb
array = ["foo", "bar", "baz"]
result = array.join(", ")
puts result
#=> foo, bar, baz
```
<br>
<br>

- 例2  
```rb
#引数に何も指定しないと配列の各要素は連結されずにそのまま結合される
array = ["foo", "bar", "baz"]
result = array.join
puts result
#=> foobarbaz
```
<br>
<br>
