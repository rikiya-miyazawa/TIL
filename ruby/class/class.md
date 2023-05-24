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
<br>
<br>

- クラス名はキャメルケースで書く  
```rb
class User  #必ず大文字始まり
end

class OrderItem  #キャメルケース
end

class user  #小文字で始めると構文エラーになる
end
```
<br>
<br>

- オブジェクトの作成とinitializeメソッド  
```rb
#クラスからオブジェクトを作成する
User.new
# この時にinitializeメソッドが呼ばれる

# インスタンスを初期化するために実行したい処理があれば、initializeメソッドでその処理を実装する
# initializeメソッドが不必要であれば省略も可能
class User
  def initialize
    puts 'initialized.'
  end
end
User.new  #=> initialized

# initializeは特殊なメソッドでデフォルトでprivateになっているため外部から呼び出すことができない
user = User.new
user.initialize  #=> private method `initialize' called for #<User:0x00007fb8913779d0> (NoMethodError)


#initializeメソッドに引数をつけると、newメソッドを呼ぶときにも引数が必要になる
class User
  def initialize(name, age)
    puts "name: #{name}, age: #{age}"
  end
end
User.new  #=> `initialize': wrong number of arguments (given 0, expected 2) (ArgumentError)
User.new('Alice', 20)  #=> name: Alice, age: 20
```
<br>
<br>

- インスタンスメソッドの定義  
```rb
# クラス構文の内部で以下のようにメソッドを定義するとインスタンスメソッドになる
# インスタンスメソッドはそのクラスのインスタンスに対して呼び出すことができるメソッドのこと

class User
  def hello
    "Hello!"
  end
end

user = User.new
user.hello  #=> "Hello!"  # Userクラスのインスタンスに対してインスタンスメソッドのhelloを呼び出せた
```
<br>
<br>

- インスタンス変数とアクセサメソッド  
```rb
# クラスの内部ではインスタンス変数を使うことができる
# インスタンス変数とは同じインスタンス(同じオブジェクト)の内部で共有される変数

class User
  # インスタンス作成時に渡された名前をインスタンス変数に保存する
  def initialize(name)
    @name = name
  end

  def hello
    # インスタンス変数に保存されている名前を表示する
    "Hello, I am #{@name}"
  end
end

user = User.new('Alice')
user.hello  #=> "Hello I am Alice"


# メソッドやブロックの内部で宣言(代入)されたローカル変数のスコープは
# その変数が宣言された位置から自身が宣言されたメソッドまたはブロックの終わりまで
# メソッドやブロックが繰り返し呼ばれると、その都度新しいローカル変数が作られる

class User
  def initialize(name)
    @name = name
  end

  def hello
    # shuffled_nameはローカル変数
    shuffled_name = @name.chars.shuffle.join
    "Hello, I am #{shuffled_name}."
  end
end

user = User.new('Alice')
user.hello  #=> "Hello, I am eiAcl."


# ローカル変数は参照する前に必ず=で値を代入して作成する必要がある
# まだ作成されていないローカル変数を参照しようとするとエラーが発生する

class User
  def initialize(name)
    @name = name
  end

  def hello
    # shuffled_nameはローカル変数
    # shuffled_name = @name.chars.shuffle.join  # わざとローカル変数への代入をコメントアウトする
    "Hello, I am #{shuffled_name}."  # 値を代入せずにいきなりローカル変数を参照する
  end
end

user = User.new('Alice')
user.hello  #=> undefined local variable or method `shuffled_name' for #<User:0x00007fd50898ffc8 @name="Alice"> (NameError)


# インスタンス変数は作成(変数に値を代入)する前にいきなり参照してもエラーにはならず、nilが返る
# 作成していなくて参照してもエラーにならないということは、タイポしても気づきにくいので気を付ける

class User
  def initialize(name)
    # @name = name
  end

  def hello
    # @nameはコメントアウトされているので作成されていない
    "Hello, I am #{@name}"
  end
end

user = User.new('Alice')
user.hello  #=> "Hello, I am "  # nilが返り値が表示されていない


# インスタンス変数はクラスの外部から参照することができない
# もし参照したい場合は参照用のメソッドを作る

class User
  def initialize(name)
    @name = name
  end

  # @nameを外部から参照するためのメソッド
  def name
    @name
  end
end

user = User.new('Alice')
user.name  #=> "Alice"  # nameメソッドを経由して@nameの内容を取得する


# インスタンス変数の内容を外部から変更したい場合も変更用のメソッドを定義する
# Rubyは=で終わるメソッドを定義すると、変数に代入するような形式でそのメソッドを呼び出すことができる

class User
  def initialize(name)
    @name = name
  end

  def name  # @nameを外部から参照するためのメソッド
    @name
  end

  def name=(value)  # @nameを外部から変更するためのメソッド
    @name = value
  end
end

user = User.new('Alice')
user.name = 'Bob'  # 変数に値を代入しているように見えるが、実際は name= メソッドを呼び出し、'Bob'を引数に渡している
user.name  #=> "Bob"
```
<br>
<br>

- アクセサメソッド  
```rb
# nameメソッドのように値を読み出すメソッドを「ゲッターメソッド」
# name= メソッドのように値を書き込むメソッドを「セッターメソッド」と呼ぶ
# 総称して「アクセサメソッド」という
# 単純にインスタンス変数の内容を外部から読み書きするのであれば、attr_accessorというメソッドを使用できる

class User
  # @nameを読み書きするメソッドが自動的に定義される
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  # attr_accessorがあれば読み書き用のメソッドを明示的に定義する必要がない

end

user = User.new('Alice')
# @nameを変更する
user.name = 'Bob'
# @nameを参照する
user.name  #=> "Bob"


# インスタンス変数の内容を読み取り専用にしたい場合はattr_readerを使う
# @nameの参照はできるが値の変更はできない

class User
  # @nameの読み取り専用のメソッドが自動的に定義される
  attr_reader :name

  def initialize(name)
    @name = name
  end
end


# インスタンス変数の内容を書き込み専用にしたい場合はattr_writerを使う
# @nameの値の変更はできるが参照はできない

class User
  # @nameへ書き込み専用のメソッドが自動的に定義される
  attr_writer :name

  def initialize(name)
    @name = name
  end
end


# カンマで複数の引数を渡すと、複数のインスタンス変数に対するアクセサメソッドを定義することもできる

class User
  # @nameと@ageへのアクセサメソッドを定義する
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

# @name @age ともにクラスの外部から参照、値の変更ができるようになる
```
<br>
<br>

- クラスメソッドの定義  
```rb
# そのクラスに関連は深いものの、ひとつひとつのインスタンスに含まれるデータは使わないメソッドを定義したい場合もある
# そういう場合はクラスメソッドを定義する
# 書き方1 メソッド名の前にselfをつける
# 主にこの書き方がメイン
class クラス名
  def self.クラスメソッド
    # クラスメソッドの処理
  end
end

# 書き方2 class << self から endの間にメソッドを書く
# 入れ子が一段階深くなるが、たくさんクラスメソッドを定義したい場合はメソッド名の前に毎回self.をつけなくて済む
class クラス名
  class << self
    def クラスメソッド
    # クラスメソッドの処理
    end
  end
end

# クラスメソッドの呼び出し方
クラス名.メソッド名


```