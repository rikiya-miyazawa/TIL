## abstract_class  
<br>

- abstract_class  
```
ActiveRecord::Baseクラスのクラスメソッド。
このメソッドを呼び出すことで、クラスが抽象クラスであることを示す。
ただし、このメソッドを呼び出す前に、self.abstract_class = trueのように、クラス自身に対してabstract_classプロパティを設定する必要がある。
これにより、クラスが抽象クラスであることが明示される。
```
<br>

```rb
class SubBase < ApplicationRecord
  self.abstract_class = true
  establish_connection :sub
end
```