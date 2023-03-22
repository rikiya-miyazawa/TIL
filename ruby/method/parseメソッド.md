## parseメソッドについて 
<br>

- parseメソッド  
```
Rubyの標準ライブラリの Date クラスや DateTime クラス、 Time クラスなどで使われる、
日付や時間の文字列を解析して、それを日付や時間のオブジェクトに変換するメソッド。

引数として解析する日付や時間の文字列を渡す。
文字列が解析された結果は、呼び出し元のクラスのオブジェクトとして返される。
文字列が不正な場合や解析できない場合は、ArgumentError 例外が発生する。
```
<br>
<br>

- 例2  
```rb
#parseメソッドに不正な引数を渡すとArgumentErrorが発生。
(1..5).each do |i|
  Book.create(
    name:"Book#{i}",
    published_on: Time.parse("ajdieka").ago(i.months),
    price: (i * 1000),
  )
end
#`make_time': no time information in "ajdieka" (ArgumentError)
```
<br>