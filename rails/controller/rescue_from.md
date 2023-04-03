- rescue_fromとは  
`指定した例外が発生した場合に、事前に定義した処理を実行することができる`  
<br>

```rb
#権限がありませんという表示をする
class ApplicationController < ActionController::Base
  rescue_from User::NotAuthorized, with: :user_not_authorized

  private

    def user_not_authorized
      flash[:error] = "あなたはこのページにアクセスする権限がありません。"
      redirect_back(fallback_location: root_path)
    end
end
```