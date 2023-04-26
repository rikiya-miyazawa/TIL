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

- bin/rails db:create:sub  
```
2つのDBを接続情報を記述したのちに、2つ目のDBとして作成した「sub」だけcreateする
```
<br>
<br>

- establish_connectionを使用して、特定のモデルを特定のDBへ接続する  
```
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