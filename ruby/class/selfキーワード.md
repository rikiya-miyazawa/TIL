## selfキーワード  
<br>

- self  
```
selfとはインスタンス自信を表す
selfは省略可能だが、明示的にselfをつけて呼び出してもOK
```
<br>

- 3パターン  
```rb
# どれも同じ結果で"Alice"を返す
# この書き方が正解！というものはない

class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def hello
    # selfなしでnameメソッドを呼ぶ
    "Hello, I am #{name}."
  end

  def hi
    # self付きでnameメソッドを呼ぶ
    "Hi, I am #{self.name}"
  end

  def my_name
    # 直接インスタンス変数の@nameにアクセスする
    "My name is #{@name}"
  end
end

user = User.new('Alice')
user.hello  #=> "Hello, I am Alice."
user.hi  #=> "Hi, I am Alice"
user.my_name  #=> "My name is Alice"
```
<br>
<br>

- selfのつけ忘れで不具合が発生するケース  
```rb
# name=メソッドの場合

class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename_to_bob
    # selfなしでname=メソッドを呼ぶ(?)
    name = 'Bob'
  end

  def rename_to_carol
    # self付きでname=メソッドを呼ぶ
    self.name = 'Carol'
  end

  def rename_to_dave
    # 直接インスタンス変数を書き換える
    @name = 'Dave'
  end
end

user = User.new('Alice')

# 'Bob'にリネームできていない
user.rename_to_bob  #=> "Bob"
user.name  #=> "Alice"
# nameというローカル変数に"Bobという文字列を代入した"と解釈されてリネームできなかった
# なのでname= のようなセッターメソッドを呼び出したい場合は必ずselfをつける必要がある


# 'Carol'にリネーム
user.rename_to_carol  #=> "Carol"
user.name  #=> "Carol"


# 'Dave'にリネーム
user.rename_to_dave  #=> "Dave"
user.name  #=> "Dave"
```
<br>
<br>

- クラスメソッドの内部やクラス構文直下のself  
```rb
# クラス定義内に登場するselfは場所によって「インスタンス自身」や「クラス自身」を表したりする

class Foo
  # このputsはクラス定義の読み込み時に呼び出される
  puts "クラス構文直下のself: #{self}"

  def self.bar
    puts "クラスメソッド内のself: #{self}"
  end

  def baz
    puts "インスタンスメソッド内のself: #{self}"
  end
end
#=> クラス構文直下のself: Foo

# Fooクラス自身
Foo.bar  #=> クラスメソッド内のself: Foo

# Fooクラスのインスタンス自身
foo = Foo.new
foo.baz  #=> インスタンスメソッド内のself: #<Foo:0x00007ff23a13de70>
```
<br>
<br>

- selfが「インスタンス自身」や「クラス自身」で異なる場合の呼び出しでエラーになるケース  
```rb
class Foo
  # クラスメソッドbar
  def self.bar
    # クラスメソッドbarの中でインスタンスメソッドbazを呼び出す
    self.baz
  end

  # インスタンスメソッドbaz
  def baz
    # インスタンスメソッドbazの中でクラスメソッドbarを呼び出す
    self.bar
  end
end

# selfが異なるためクラスメソッドbarの中でインスタンスメソッドbazは呼ぶ出せない
Foo.bar  #=> undefined method `baz' for Foo:Class (NoMethodError)
         # Did you mean?  bar 

foo = Foo.new
foo.baz  #=> undefined method `bar' for #<Foo:0x00007fc23e950e18> (NoMethodError)
         # Did you mean?  baz
```
<br>
<br>

- クラス構文の直下ではクラスメソッドを呼び出すことができる
```rb
class Foo
# この時点ではクラスメソッドbarが定義されていないので呼び出せない
# self.bar  => (NoMethodError)

  def self.bar
    puts "hello!"
  end

  self.bar
end

#=> hello!
```