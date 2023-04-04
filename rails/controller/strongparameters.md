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
