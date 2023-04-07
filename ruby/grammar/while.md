## while
<br>

- 条件が成立し続ける限り実行されるループ文  
<br>

- 基本構文
```rb
#doは省略されることが多い
while 繰り返し続ける条件 do
 繰り返したい処理
end
```
<br>

```rb
count = 1

while count <= 5
  puts "#{count}回目"
  count += 1
end
```
<br>

```
#実行結果
1回目
2回目
3回目
4回目
5回目
```
<br>

- break句を使うとそのブロックの処理が行われた時に、強制的に処理を終了できる。
<br>

```rb
count = 1

while count <= 5
  puts "#{count}回目"
  if count == 1
    count += 1
  elsif count == 2
    count += 1
  elsif count == 3
    count += 1
    break
  elsif count == 4
    count += 1
  elsif count == 5
    count += 1
  end
end
```
<br>

```
#実行結果
#３回目でループを強制的に抜け出す
1回目
2回目
3回目
```