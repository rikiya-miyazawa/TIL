- caseの値とwhenの値が一致した時に、一致したブロックの処理が実行される  
```rb
case 比較したいオブジェクト

when 値1
  処理1
when 値2
  処理2
when 値3
  処理3
else
  処理4
end
```
<br>

```rb
age = 20

case age
when 10
  puts "未成年"
when 20 #ここでcaseの値と一致する
  puts "成人"
when 60
  puts "定年"
else
  puts ""
end
#=> 成人
```