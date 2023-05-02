## unless
<br>

- 条件「〜ではない」時にtrueとなる if文の逆  
```rb
#20が28より大きくなければtrue
age = 28
unless age < 20 
  puts "未成年ではありません"
end
#=> 未成年ではありません
```
<br>

- unless文はelseは使えるが、elsifで複数の条件分岐を行うことはできない！  
<br>

- 後置ifのように後置unlessもできる