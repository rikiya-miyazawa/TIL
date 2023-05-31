## reverse_eachメソッド  
<br>

- 配列や範囲オブジェクトを逆順に反復処理するためのメソッド
```rb
# 要素を末尾から先頭に向かって順番に取り出し、ブロック内でそれぞれの要素に対して処理を行う
array = [1, 2, 3, 4, 5]
array.reverse_each do |element|
  puts element
end

#=> 5
#=> 4
#=> 3
#=> 2
#=> 1
```