## credentials  
<br>

- credentials  
```
機密情報の取り扱い
bin/rails credentials:showで確認
bin/rails credentials:editで編集
```
<br>
<br>

- credentials:editでエラー  
```
No $EDITOR to open file in. Assign one like this:

EDITOR="mate --wait" bin/rails credentials:edit

For editors that fork and exit immediately, it's important to pass a wait flag,
otherwise the credentials will be saved immediately with no chance to edit.

エディターを指定して実行する
```