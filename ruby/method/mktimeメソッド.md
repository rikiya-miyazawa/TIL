## mktimeメソッドについて 
<br>

- mktimeメソッド  
```
Timeクラスのインスタンスを作成するメソッドの1つ。
引数として渡された年月日時分秒を元に、指定されたタイムゾーンでの時間を表すTimeオブジェクトを生成する。

引数は、秒数、分、時、日、月、年の順に渡す。
これらの値はすべて数値で表現される。
また、引数を省略することもできる。
省略された値は、現在の日時として扱われる。

Time.newやTime.localも同じ働きをする。
```
<br>
<br>

- 例  
```rb
time = Time.mktime(2023, 3, 5, 10, 30, 0)
#=> 2023-03-05 10:30:00 +0900
```
<br>
<br>