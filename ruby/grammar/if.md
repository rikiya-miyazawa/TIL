## if 
<br>

- if文  
```
Rubyのif文は最後に評価された式を戻り値として返す
if 条件式 then 処理 で1行で記述することもできる
処理 if 条件式 で後置ifとして簡潔に記述できる
```
<br>
<br>

- if文の戻り値を変数に代入する  
```rb
変数名 = 
if文
puts 変数名
#=> 戻り値の値

#elseがなくどの条件にも合致しなかった場合はnilが返る
puts 変数名
#=> nil
```
<br>
<br>

- 後置if  
```rb
#通常のif文
point = 7
day = 1
#1日であればポイント5倍
if day == 1
  point *= 5
end
p point
#=> 35

#後置if
処理 if 条件式

point = 7
day = 1

point *= 5 if day == 1
p point
#=> 35
```
<br>
<br>

- == true や == falseは冗長なので書かない  
```rb
s = ""
# s.empty?の時点でtrueが返ってくるので == trueは無駄
if s.empty? == true
  "空文字列です"
end

n = 123
#この書き方ではなく
if n.zero? == false
  "ゼロではありません"
end
#!でtrueをfalseへ変換 unless文でも可
if !n.zero?
  "ゼロではありません"
end
```