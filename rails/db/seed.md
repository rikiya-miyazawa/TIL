## seed  
<br>

- bin/rails db:seed  
```
あらかじめ用意したデータを取り込める
db:seedを複数回実行するとその都度レコードの追加が行われてしまう
```
<br>
<br>

- bin/rails db:seed:replant  
```
一度レコードを削除し、改めてdb:seedを実行する
```