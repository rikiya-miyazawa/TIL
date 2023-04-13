- 意図しない属性の変更を一般ユーザに許してしまうことを防ぐ  
<br>

```rb
#user_paramsの内容
#リクエストに:userというkeyが必要であること
#userの中で受け付けて良いのは「:name, :email」の２つのキーのみ
def update
  user = current_user
  user.update(user_params)
end

private

def user_params
  params.require(:user).permit(:name, :email)
end
#permitにより許可されていないパラメータは無視される
```
<br>
<br>

```rb
#StrongParametersの受け入れ条件を状況によって切り替える
#管理権限のあるユーザは自分のadmin権限を変更できる
def update
  user = current_user
  user.update(user_params)
end

private

def user_params
  if current_user.admin?
    params.require(:user).permit(:name, :email, :admin)
  else
    params.require(:user).permit(:name, :email)
  end
end
```
