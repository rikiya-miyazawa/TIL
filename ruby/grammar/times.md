## times  
<br>

- 先に繰り返す回数を指定してループ処理をする
```rb
#基本構文
繰り返す回数.times do
  繰り返したい処理
end
```
<br>

```rb
5.times do
  puts "Hello World"
end

count = 0
5.times do
  count += 1
  puts count
end
```
<br>

```
#実行結果
Hello World
Hello World
Hello World
Hello World
Hello World

#実行結果2
1
2                                
3                                
4                                
5
```
<br>
<br>

```rb
n = 5
a = [1, 2, 3, 4, 5]
b = [5, 4, 3, 2, 1]

#この場合iはa,b配列のインデックス番号となる
n.times do |i|
  #1回目のループでは、iの値が0であり、b[0] - a[0]の差が計算される。
  #2回目のループでは、iの値が1であり、b[1] - a[1]の差が計算される。
  puts a[i] - b[i] 
end

#=> -4
#=> -2
#=> 0
#=> 2
#=> 4
```