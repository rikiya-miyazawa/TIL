## logged_in?メソッド  
<br>

- logged_in?メソッド  
```rb
#app/controllers/application_controller.rb
#ユーザがログインしていればtrueをしていなければfalseを返すメソッド
#not演算子(!)をふたつ重ねることで
#session[:user_id]がfalseまたはnilの時はfalseを、それ以外の値の時はtrueへ変換する
#コントローラとビューの両方から利用する機会がある場合はヘルパーメソッドでメソッド名を宣言しておく
helper_method :logged_in?

private

def logged_in?
  !!session[:user_id]
end
```