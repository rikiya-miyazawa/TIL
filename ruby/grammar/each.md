## each  
<br>

- 繰り返し文  
```rb
#基本構文
配列,範囲オブジェクト.each do |変数名|
  処理
end
```
<br>

```rb
#配列
["晴れ", "曇り", "雨"].each do |tenki|
  puts tenki
end
#=> 晴れ
#=> 曇り
#=> 雨

#ハッシュ
{ title: "こんにちは", content: "寒いですね" }.each do |key, value|
  puts "#{key} #{value}"
end
#=> title こんにちは
#=> content 寒いですね

teachers = {national_language: "yamada", science: "ono", math: "murakami"}
teachers.each do |key, value|
  puts "科目#{key} 先生#{value}"
end
#=> 科目national_language 先生yamada
#=> 科目science 先生ono       
#=> 科目math 先生murakami
```