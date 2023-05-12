## authenticateメソッド
<br>

- ログインしていなければトップページにリダイレクトさせるメソッド  
```rb
#app/controllers/application_controller.rb
def authenticate
  #ログインしていたらreturnで処理を抜ける
  return if logged_in?
  #ログインしていなければトップページにリダイレクトさせる
  redirect_to root_path, alert: "ログインしてください"
end
```