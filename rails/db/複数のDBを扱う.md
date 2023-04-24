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
2つのDBを接続する情報を記述したのちに、2つ目のDBとして作成した「sub」だけcreateする
```
<br>

