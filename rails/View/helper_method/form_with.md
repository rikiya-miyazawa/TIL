## form_with
<br>

- Railsガイド Action Viewの概要  
`https://railsguides.jp/action_view_overview.html`
<br>

- form_withヘルパー  
```
フォームを構築するためのヘルパーメソッド
モデルの情報を元にURLを送信したり、
対応するフィールドの内容を埋めたり、
エラーを表示したりできる。
```
<br>
<br>

- form_withでAjaxの挙動をオフにする  
```
local: true というオプションを追加する
<%= form_with(model: @education, local: true) do |form| %>

アプリケーション全体でlocal: trueの設定を追加したい場合の設定
form_withのデフォルトの挙動を変更できる
config/application.rb
config.action_view.form_with_generates_remote_forms = false
```