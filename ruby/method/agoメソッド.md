## agoメソッドについて 
<br>

- agoメソッド  
```
ActiveSupport::TimeWithZoneクラスに定義されたメソッド。
指定された時間だけ過去に戻った時刻を返す。
メソッドの引数には、秒、分、時間、日、週、月、年などの時間単位を指定することができる。
たとえば、1日前の時間を取得する場合は、1.day.agoというように記述できる。
また、負の数を指定することで、未来の時間を取得することもできる。
```
<br>
<br>

- 例  
```rb
require 'active_support'
date = Date.today
yesterday = 1.day.ago(date)
puts yesterday 
#=> 2023-03-21
```