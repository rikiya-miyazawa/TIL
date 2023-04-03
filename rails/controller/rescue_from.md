- rescue_fromとは  
`指定した例外が発生した場合に、事前に定義した処理を実行することができる`  
<br>

```
メリット
rescue_fromは、指定した例外が発生した場合にのみ実行されるため、
コントローラーのアクションごとにbegin-rescue構文を使って例外処理を書く必要がなくなり、コードの重複を避けることができる。
```
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
<br>

```rb
#管理者以外は編集できない
class ClientsController < ApplicationController
  before_action :check_authorization

  def edit
    @client = Client.find(params[:id])
  end

  private

    def check_authorization
      raise User::NotAuthorized unless current_user.admin?
    end
end
```