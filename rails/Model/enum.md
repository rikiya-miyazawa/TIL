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
<br>

```
irb(main):013:1* Book.create(
irb(main):014:1*   name: "enum Book 3",
irb(main):015:1*   sales_status: 1,
irb(main):016:1*   publisher: Publisher.find(1),
irb(main):017:1*   price: 100
irb(main):018:0> )
  Publisher Load (0.3ms)  SELECT "publishers".* FROM "publishers" WHERE "publishers"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
  TRANSACTION (0.1ms)  begin transaction
  Book Create (0.4ms)  INSERT INTO "books" ("name", "price", "created_at", "updated_at", "publisher_id", "sales_status") VALUES (?, ?, ?, ?, ?, ?)  [["name", "enum Book 3"], ["price", 100], ["created_at", "2023-03-30 12:15:12.545901"], ["updated_at", "2023-03-30 12:15:12.545901"], ["publisher_id", 1], ["sales_status", 1]]
  TRANSACTION (1.6ms)  commit transaction
=> 
#<Book:0x00007f899ccced18
 id: 6,
 name: "enum Book 3",
 published_on: nil,
 price: 100,
 created_at: Thu, 30 Mar 2023 12:15:12.545901000 UTC +00:00,
 updated_at: Thu, 30 Mar 2023 12:15:12.545901000 UTC +00:00,
 publisher_id: 1,
 sales_status: "now_on_sale">
 ```
 <br>
 <br>

 - ステータスごとに述語メソッドで状態を確認可能  
 ```
irb(main):001:0> book = Book.last
   (0.4ms)  SELECT sqlite_version(*)
  Book Load (0.1ms)  SELECT "books".* FROM "books" ORDER BY "books"."id" DESC LIMIT ?  [["LIMIT", 1]]
=> 
#<Book:0x00007f899cb20de0
...
irb(main):002:0> book.now_on_sale?
=> true
irb(main):003:0> book.end_of_print?
=> false
 ```
 <br>
 <br>

 - enumの値の末尾に「!」月のメソッドを使うと、そのenumの値へ変更できる  
```
irb(main):002:0> book.now_on_sale?
=> true
irb(main):003:0> book.end_of_print?
=> false
irb(main):004:0> book.end_of_print!
  TRANSACTION (0.1ms)  begin transaction
  Publisher Load (0.2ms)  SELECT "publishers".* FROM "publishers" WHERE "publishers"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
  Book Update (0.5ms)  UPDATE "books" SET "updated_at" = ?, "sales_status" = ? WHERE "books"."id" = ?  [["updated_at", "2023-03-30 12:21:52.414994"], ["sales_status", 2], ["id", 6]]
  TRANSACTION (1.0ms)  commit transaction
=> true
irb(main):005:0> book
=> 
#<Book:0x00007f899cb20de0
 id: 6,
 name: "enum Book 3",
 published_on: nil,
 price: 100,
 created_at: Thu, 30 Mar 2023 12:15:12.545901000 UTC +00:00,
 updated_at: Thu, 30 Mar 2023 12:21:52.414994000 UTC +00:00,
 publisher_id: 1,
 sales_status: "end_of_print">
irb(main):006:0> book.end_of_print?
=> true
irb(main):007:0> book.now_on_sale?
=> false
```  
<br>
<br>

- enumで定義したカラムを直接参照すると文字列の値が取得できる  
```
irb(main):008:0> book.sales_status
=> "end_of_print"

irb(main):010:0> book.now_on_sale!
irb(main):011:0> book.sales_status
=> "now_on_sale"
```
<br>
<br>

- before_type_castメソッドでDBに保存されている実際の値を確認する  
```
irb(main):009:0> book.sales_status_before_type_cast
=> 2

irb(main):010:0> book.now_on_sale!
irb(main):012:0> book.sales_status_before_type_cast
=> 1
```
<br>
<br>

- enumで定義したカラム名の複数形メソッドをクラスメソッドとして呼び出して、enumの定義を確認する  
```
irb(main):013:0> Book.sales_statuses
=> {"reservation"=>0, "now_on_sale"=>1, "end_of_print"=>2}
```
<br>
<br>

- enumで定義していない値で保存するとArgumentErrorが発生する  
<br>

- enum型の名称で検索するためのscopeも追加される  
```
enum名で検索

irb(main):021:0> Book.now_on_sale
  Book Load (0.2ms)  SELECT "books".* FROM "books" WHERE "books"."sales_status" = ?  [["sales_status", 1]]
=> 
[#<Book:0x00007f899cd5e300
  id: 4,
  name: "enum Book 1",
  published_on: nil,
  price: 100,
  created_at: Thu, 30 Mar 2023 12:14:10.242010000 UTC +00:00,
  updated_at: Thu, 30 Mar 2023 12:14:10.242010000 UTC +00:00,
  publisher_id: 1,
  sales_status: "now_on_sale">,
 #<Book:0x00007f899cd5e1e8
  id: 5,
  name: "enum Book 2",
  published_on: nil,
  price: 100,
  created_at: Thu, 30 Mar 2023 12:14:49.622769000 UTC +00:00,
  updated_at: Thu, 30 Mar 2023 12:14:49.622769000 UTC +00:00,
  publisher_id: 1,
  sales_status: "now_on_sale">]


  該当enum名を含まない検索

  irb(main):020:0> Book.not_now_on_sale
  Book Load (0.4ms)  SELECT "books".* FROM "books" WHERE "books"."sales_status" != ?  [["sales_status", 1]]
=> 
[#<Book:0x00007f8979425e78
  id: 6,
  name: "enum Book 3",
  published_on: nil,
  price: 100,
  created_at: Thu, 30 Mar 2023 12:15:12.545901000 UTC +00:00,
  updated_at: Fri, 31 Mar 2023 08:23:27.253462000 UTC +00:00,
  publisher_id: 1,
  sales_status: "end_of_print">]
```  
<br>
<br>

