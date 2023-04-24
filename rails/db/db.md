## DB  
<br>

- dbに関する重要度の高いrailsコマンド  
`表3.3参照`
<br>
<br>

- bin/rails db:drop  
```
DBの削除を行う
```
<br>
<br>

- bin/rails db:setup  
```
DBの作成、テーブルの構築、seedの読み込みを行う
```
<br>
<br>

- bin/rails db:reset  
```
db:dropとdb:setupを連続して実行する
```
<br>
<br>

- bin/rails db:prepare  
```
DBが存在する場合はマイグレーションを行い、DBが存在しない場合はDBのセットアップを実行する
```