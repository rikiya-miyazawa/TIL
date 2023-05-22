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
<br>
<br>

- 変数への代入と条件分岐を同時に実現する  
```rb
#国名に応じて通貨を返す(該当する通貨がなければnil)
def find_currency(country)
  currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
  currencies[country]
end

#指定された国の通貨を大文字にして返す
def show_currency(country)
  currency = find_currency(country)
  #nilでないことをチェック
  if currency
    currency.upcase
  end
end

show_currency(:japan) #=> "YEN"
show_currency(:korea) #=> nil


#Rubyでは変数への代入自体が戻り値をもつ
#if文の中で直接変数へ代入することも可能
def show_currency(country)
  #値が取得できれば真、できなければ偽
  if currency = find_currency(country)
    currency.upcase
  end
end



```