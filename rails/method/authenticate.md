## authenticateメソッド
<br>

- ログインしていなければトップページにリダイレクトさせるメソッド  
```rb
#app/controllers/application_controller.rb
def authenticate
  #ログインしていたらreturnで処理を抜ける
  #ログイン状態を確認するlogged_in?メソッドも実装する必要あり
  return if logged_in?
  #ログインしていなければトップページにリダイレクトさせる
  redirect_to root_path, alert: "ログインしてください"
end
```