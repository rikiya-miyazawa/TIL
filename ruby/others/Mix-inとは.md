## Mix-inについて 
<br>

- Mix-in 
```
複数のクラスに同じ機能を追加するための仕組み。
Mix-inは、Rubyのモジュールを使って実装される。

Mix-inはあるクラスにモジュールをincludeすることで、そのクラスにモジュールで定義されたメソッドや定数を取り込むことができる。
このようにして、複数のクラスで同じ機能を共有することができる。

Mix-inを使うことで、共通の機能を複数のクラスで簡単に共有することができる。
また、Mix-inを使うことで、クラスの継承関係を複雑にせずに機能を拡張することができるため、柔軟なコードを書くことができる。
```
<br>
<br>

- 例1  
```rb
module MyModule
  def my_method
    puts "Hello, world!"
  end
end

class MyClass1
  include MyModule
end

class MyClass2
  include MyModule
end

obj1 = MyClass1.new
obj2 = MyClass2.new

obj1.my_method #=> "Hello, world!"
obj2.my_method #=> "Hello, world!"
```
<br>
<br>
