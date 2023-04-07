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