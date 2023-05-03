## AcitionMailer  
<br>

- AcitionMailer  
```
メール送信機能を簡単に実装できる
ActionMailbox(メール受信のライブラリ)と対になるライブラリ
メール送信時はUserMailerクラスから送信指示を出す
mailメソッドを呼び出すとHTMLとテキストの2種類のテンプレートがあるかどうかを探し、
multipart/altenative形式のメールを作成する
```
<br>
<br>

- Mailerクラスの設計  
```
コントローラーと似ている
paramsオブジェクトを経由して渡されたデータを取得する
メイラークラスで処理した内容をインスタンス変数へ代入してビューへ渡す
コールバックやヘルパーメソッドが用意されている
```
<br>

```rb
#app/mailers/application_mailer.rb
#デフォルトのメールアドレス(送り主)を編集する
class ApplicationMailer < ActionMailer::Base
  default from: 'tilitl@til.com'
  layout 'mailer'
end

#app/mailers/user_mailer.rb
#メール送信の処理のwelcomeメソッドを実装
#@nameの値はビューへ渡す
class UserMailer < ApplicationMailer
  def welcome
    @name = params[:name]
    mail(to: params[:to], subject: '登録完了')
  end
end

#app/views/user_mailer/welcome.html.erb
#
```
<br>
<br>

- プレビューで確認できる  
```rb
#test/mailers/previews/user_mailer_preview.rb
class UserMailerPreview < ActionMailer::Preview
  def welcome
    UserMailer.with(to: "igarashi@example.com", name: "igaiga").welcome
  end
end
#http://localhost:3000/rails/mailers/user_mailer/welcome.htmlへアクセス
#メールのプレビューが見れる
```