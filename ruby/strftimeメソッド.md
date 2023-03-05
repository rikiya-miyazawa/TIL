## strftimeメソッドについて 
<br>

- strftimeメソッド  
```
Rubyの標準ライブラリであるTimeやDateTimeなどの時間データ型オブジェクトを、
指定したフォーマットに変換するためのメソッド。

strftimeメソッドを使用すると、時間データ型オブジェクトを、
指定されたフォーマットに従って、文字列に変換することができる。
strftimeメソッドの引数には、変換後の文字列のフォーマットを表す文字列を指定する。

フォーマット指定子 %Yは西暦年、%mは月、%dは日、%Hは時（24時間制）、%Mは分、%Sは秒を表す。
```
<br>
<br>

```rb
require 'date'

now = DateTime.now
puts now.strftime("%Y年%m月%d日 %H時%M分%S秒")
```
<br>
<br>

```
irb(main):001:0> require 'date'
=> true
irb(main):002:0> now = DateTime.now
=> #<DateTime: 2023-03-05T16:40:23+09:00 ((2460009j,27623s,986584000n),+...
irb(main):003:0> puts now.strftime("%Y年%m月%d日 %H時%M分%S秒")
2023年03月05日 16時40分23秒
```