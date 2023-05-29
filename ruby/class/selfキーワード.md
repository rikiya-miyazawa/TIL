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


# 'Carol'にリネーム
user.rename_to_carol  #=> "Carol"
user.name  #=> "Carol"


# 'Dave'にリネーム
user.rename_to_dave  #=> "Dave"
user.name  #=> "Dave"
```