## current_userメソッド  
<br>

- ログインしているユーザを取得するメソッド  
```rb
#app/controllers/application_controller.rb
def current_user
    #ログインしているユーザ自身でなければreturnで処理を抜ける
    return unless session[:user_id]
    #@current_userにログインしているユーザの情報を代入する
    @current_user ||= User.find(session[:user_id])
  end
```