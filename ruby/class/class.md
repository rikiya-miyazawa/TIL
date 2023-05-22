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
  # attr_readerは、インスタンス変数に対してゲッターメソッドを自動的に生成するための便利な方法
  # 目には見えないがattr_readerのおかげで下記のメソッドが定義されているのと同じ状態になっている
  # def first_name
  #   @first_name
  # end

  # def last_name
  #   @last_name
  # end

  # def age
  #   @age
  # end

  def full_name
    "#{first_name} #{last_name}"  # attr_readerを使用することでメソッド内でインスタンス変数の値にアクセスすることができる
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

- クラス  
```
クラスは一種のデータ型
オブジェクトの設計図/雛形
Rubyではオブジェクトは必ず何らかのクラスに属している
クラスが同じであれば、保持している属性(データ項目)や使えるメソッドは原則として同じになる
```
<br>

- オブジェクト、インスタンス、レシーバ  
```rb
クラスから様々なオブジェクトが作られる
同じクラスから作られたオブジェクトは同じ属性やメソッドを持つが、属性の中に保持されるデータ(名前や数値、色など)はオブジェクトによって異なる

class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

alice = User.new('Alice', 'Ruby', 20)
bob = User.new('Bob', 'Python', 30)
#どちらもfull_nameメソッドを持つが、保持しているデータが異なるので戻り値は異なる
alice.full_name  #=> "Alice Ruby"
bob.full_name  #=> "Bob Python"

#=> "Alice Ruby"
#=> "Bob Python"
のようにクラスをもとにして作られたデータの塊をオブジェクトと呼ぶ
オブジェクトとインスタンスは同じ意味の別の名前の単語

レシーバ
メソッドを呼び出された側
alice.full_name  #この場合はaliceに対して.full_nameメソッドが呼ばれたのでaliceがレシーバ
```
<br>

- メソッド、メッセージ  
```rb
オブジェクトが持つ「動作」や「振る舞い」のことをメソッドという
何らかの処理をひとまとめにして名前をつけ、何度も再利用できるようにしたものがメソッド

user = User.new('Alice', 'Ruby', 20)
user.first_name  # userというレシーバに対して、first_nameというメッセージを送っている
                 # レシーバに対して「first_nameを教えて」とメッセージを送るようなイメージ
                 # オブジェクト指向では「Smalltark」と呼ばれ、よく使われる呼び方。
```
<br>
<br>

- 状態(ステート)  
```rb
オブジェクトごとに保持されるデータのことを「オブジェクトの状態(ステート)」と呼ぶことがある
Userクラスが持つ「名前」や「年齢」といったデータも「Userの状態」という

User.new('Alice', 'Ruby', 20)  # ('Alice', 'Ruby', 20)ここの部分を「状態」(ステート)という
```
<br>
<br>

- 属性(アトリビュート、プロパティ)  
```rb
オブジェクトの状態(オブジェクト内の各データ)は外部から取得したり変更したりできる場合がある
オブジェクトから取得、再設定できる値のことを属性(アトリビュート、プロパティ)と呼ぶ

class User
  # first_nameのみ外部からの取得、書き換えを許可する
  attr_accessor :first_name

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end
end

user = User.new('Alice', 'Ruby', 20)
user.first_name  #=> "Alice"  外部から取得できる
user.first_name = 'アリス'  # 外部から値の変更ができる
user.first_name  #=> "アリス"
```