## 複数のDBを扱う  
<br>

- 2つのDBへアクセスする  
```rb
#まずはconfig/database.ymlの記述を変更する
#primaryとsubの記述を追加
#db/sub_migrateディレクトリを作成する
development:
  primary:
    <<: *default
    database: db/development.sqlite3
  sub:
    <<: *default
    database: db/development_sub.sqlite3
    migrations_paths: db/sub_migrate

test:
  primary:
    <<: *default
    database: db/test.sqlite3
  sub:
    <<: *default
    database: db/test_sub.sqlite3
    migrations_paths: db/sub_migrate

production:
  primary:
    <<: *default
    database: db/production.sqlite3
  sub:
    <<: *default
    database: db/production_sub.sqlite3
    migrations_paths: db/sub_migrate
```
<br>

- --databaseオプション  
```
マイグレーションファイルの出力先がデータベースへ指定したmigrations_pathsになる。
migrations_paths: db/sub_migrate
db/sub_migrate/20230426065029_create_authors.rb

bin/rails g model author name:string --database=sub
Running via Spring preloader in process 59720
      invoke  active_record
      create    db/sub_migrate/20230426065029_create_authors.rb
      create    app/models/sub_record.rb
      create    app/models/author.rb
      invoke    test_unit
      create      test/models/author_test.rb
      create      test/fixtures/authors.yml
```
<br>
<br>

- bin/rails db:create:sub  
```
2つのDBを接続情報を記述したのちに、2つ目のDBとして作成した「sub」だけcreateする
```
<br>
<br>

- establish_connectionを使用して、特定のモデルを特定のDBへ接続する  
```rb
#役割を明確にするためestablish_connectionを指定した抽象クラスを作成
#そのクラスを継承したモデルクラスを利用する
#app/models/sub_base.rb
class SubBase < ApplicationRecord
  self.abstract_class = true
  establish_connection :sub
end

#app/models/author.rb
class Author < SubBase
end
```

<br>

- abstract_class  
```
ActiveRecord::Baseクラスのクラスメソッド。
このメソッドを呼び出すことで、クラスが抽象クラスであることを示す。
ただし、このメソッドを呼び出す前に、self.abstract_class = trueのように、クラス自身に対してabstract_classプロパティを設定する必要がある。
これにより、クラスが抽象クラスであることが明示される。
```
<br>
<br>

- 実際に複数DBとして望まれるケース  
```
書き込みと読み込みの負荷を軽減させるためにそれらのDBを分離する。
書き込み専用のDBを「プライマリーDB」
読み込み専用のDBを「レプリカDB」と呼ぶ。
rails db タスクではreplica: trueの指定で制御できるが、
アプリケーション内ではどちらのDBへ接続するか明示する必要がある。
```
<br>
<br>

- マスター用とレプリカ用MySQLインスタンスをそれぞれ用意した場合の設定例  
```yml
#config/database.yml
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: <%= ENV.fetch("RAILS_MAX_THREADS"){ 5 }%>
  username: root
  password:
  host: 127.0.0.1

development:
  primary:
    <<: *default
    database: db_sample_development
    port: 33061
  primary_replica:
    <<: *default
    database: db_sample_development
    port: 33062
    replica: true
```