## railsコマンドについて  
<br>

- `bin/rails -h`  
利用可能なrails コマンドの一覧を表示
<br>
<br>

- `よく利用するRailsコマンド(1)`  
表1.4を参照
<br>
<br>

- `よく利用するRailsコマンド(2)`  
表1.5を参照
<br>
<br>

- `bin/rails dbconsole`  
テーブル定義を確認できるコマンド  
<br>

```
SQLite version 3.39.4 2022-09-07 20:51:41
Enter ".help" for usage hints.
sqlite> .schema tasks (.schema 確認したいテーブル名を入力)
CREATE TABLE IF NOT EXISTS "tasks" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
sqlite> .quit (.quitで終了)
```
