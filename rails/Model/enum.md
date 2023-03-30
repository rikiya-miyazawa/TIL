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
 