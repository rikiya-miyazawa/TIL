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

# 勝手に新しいキーを追加
users[0][:country] = 'japan'
# 勝手にfirst_nameを変更
users[0][:first_name] = 'Carol'
# ハッシュの中身が変更される
users[0]  #=> {:first_name=>"Carol", :last_name=>"Ruby", :age=>20, :country=>"japan"}
```
<br>

- 対応するクラスを作る場合  
```rb
#Userクラスという新しいデータ型を作り、そこにデータを入れたほうがより堅牢なプログラムになる
#タイポや勝手な変更をしようとした場合、しっかりエラーになる

class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end
end

#ユーザのデータを作成する
users = []
users << User.new('Alice', 'Ruby', 20)
users << User.new('Bob', 'Python', 30)

#氏名を作成するメソッド
def full_name(user)
  "#{user.first_name} #{user.last_name}"
end

#ユーザのデータを表示する
users.each do |user|
  puts "氏名: #{full_name(user)}、年齢: #{user.age}"
end
#=> 氏名: Alice Ruby、年齢: 20
#=> 氏名: Bob Python、年齢: 30

# タイポをした時にエラーが発生する
users[0].first_name  #=> "Alice"
users[0].first_mame  #=> undefined method `first_mame' for #<User:0x00007f8d4f1ef468 @first_name="Alice", @last_name="Ruby", @age=20> (NoMethodError)

# 勝手に属性を追加できない
users[0].country = 'japan'  #=> undefined method `country=' for #<User:0x00007f8d4f1ef468 @first_name="Alice", @last_name="Ruby", @age=20> (NoMethodError)
# 勝手にfirst_nameを変更できない
users[0].first_name = 'Carol'  #=> undefined method `first_name=' for #<User:0x00007f8d4f1ef468 @first_name="Alice", @last_name="Ruby", @age=20> (NoMethodError)

#クラスの内部にメソッドを追加することもできる
class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end
  # 引数を渡す必要がなくなり、クラス外で定義する時よりもシンプルな記述になる
  def full_name
    "#{first_name} #{last_name}"
  end
end

users = []
users << User.new('Alice', 'Ruby', 20)
users << User.new('Bob', 'Python', 30)

users.each do |user|
  #.full_nameのようにシンプルにクラス内のメソッドを使うことができる
  puts "氏名: #{user.full_name}、年齢: #{user.age}"
end

# 氏名: Alice Ruby、年齢: 20
# 氏名: Bob Python、年齢: 30

クラスは内部にデータを保持し、さらに自分が保持しているデータを利用する独自のメソッドを持つことができる
データとそのデータに関するメソッドが常にセットになる
クラスを使わない場合に比べてデータとメソッドの整理がしやすくなる
大きなプログラムになるほど、データとメソッドを一緒に持ち運べるクラスのメリットが大きくなる
```
<br>
<br>

- オブジェクト指向関連の用語  
```
・クラス
・オブジェクト
・インスタンス
・レシーバ
・メソッド
・メッセージ
・状態(ステート)
・属性(アトリビュート、プロパティ)
```
<br>

- 