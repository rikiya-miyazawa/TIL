- enum型は数値のカラムに対してプログラム上で扱える別名を与える  
<br>

- カラムを追加する  
```
bin/rails g migration AddStatusToBooks sales_status:integer
bin/rails db:migrate
```
<br>
<br>

- enumクラスメソッドにカラム名と対応する値を定義する  
`定義する値はハッシュか配列`  
<br>

```rb
#ハッシュ
enum sales_status: {
    reservation: 0,
    now_on_sale: 1,
    end_of_print: 2,
  }
```