## class  
<br>

- class
```
・元々あるStringクラスやArrayクラスなどの他に、クラスは自作できる
```
<br>
<br>

- クラスを使わない場合  
```rb
#ユーザを表すデータをプログラム上で処理する

users = []
users << { first_name: 'Alice', last_name: 'Ruby', age: 20 }
users << { first_name: 'Bob', last_name: 'Python', age: 30 }

#氏名を作成するメソッド
def full_name(user)
  "#{user[:first_name]} #{user[:last_name]}"
end

#ユーザのデータを表示する
users.each do |user|
  puts "氏名: #{full_name(user)}、年齢: #{user[:age]}"
end
#=> 氏名: Alice Ruby、年齢: 20
#=> 氏名: Bob Python、年齢: 30

#ハッシュだとタイポした時に気づかなかったり、キーを追加したり、内容を変更できるので
#データ量が増えるともろくて管理しづらいプログラムになってしまう

```