## includeメソッドについて 
<br>

- includeメソッド  
```
Rubyのモジュール機能の一つで、クラスや別のモジュールに、他のモジュールの機能を取り込むために使用される。
取り込まれたモジュールの機能は、インスタンスメソッドとしてクラスやモジュール内で使用することができる。

includeメソッドによって、他のモジュールの機能を取り込むことで、クラスやモジュールの機能を拡張することができる。
```
<br>
<br>

- module Foo  
```rb
module Foo
  def hello
    puts "Hello!"
  end
end
```
<br>

- include  
```rb
#BarクラスにFooモジュールをinclude
class Bar
  include Foo
end

#インスタンスメソッドとして使える
bar = Bar.new
bar.hello #=> "Hello!"
```
<br>


