## rails-ujs  
<br>

- rails-ujs  
```
画面の制御を補助するJavaScriptライブラリ
submitボタン押下時にダイアログ表示や入力フォームの内容を二重送信しないような制御など
form_withやlink_toなどの特定のヘルパーメソッドにオプションを追加するだけで使える
```
<br>
```
submitボタンが「送信中」となりクリックできなくなる
data: { disable_with: '送信中' }
disable_with
<div class="actions">
    <%= form.submit data: { disable_with: '送信中' } %>
  </div>
```
<br>
<br>

- 確認ダイアログを出す  
```
data: { confirm: '実行してもよろしいですか？'}
confirm
<div class="actions">
    <%= form.submit data: { confirm: '実行してもよろしいですか？', disable_with: '送信中' } %>
  </div>
```
<br>
<br>

- 手軽にAjax通信を行う  
```
rails-ujsはHTTPリクエストをAjax化するための機能もある
form_withのlocal:trueの記述は通常の画面遷移をする記述(非同期ではなく)
local: falseにするとTypeがxhrになりAjax通信になる
非同期で返されるレスポンスはTurbolinksで結果を反映する
```