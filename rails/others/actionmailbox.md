## Acition Mailbox  
<br>

- Acition Mailbox  
```
メールを受信した時に処理を行うライブラリ
SendGridなどのメールサービスと協調して動作する
Action Mailboxは受信メールを保存するときにActive Storageを
メールに応じた非同期処理の実行およびメールデータの一定期間後削除にActive Jobを利用している
```
<br>
<br>

- Action Mailboxのセットアップ  
`bin/rails action_mailbox:install`  
<br>

- SendGridを利用する設定をする  
```rb
#config/environments/production.rb
config.action_mailbox.ingress = :sendgrid
```
<br>
<br>

- 外部からのリクエストを認証するためパスワードを設定する  
```
bin/rails credentials:editを実行
設定を追加する
```
<br>
<br>

- SendGridの設定を行う  
```
SendGridのParse Webhookという機能を利用する
ドメインのDSN設定でMXレコードを設定しておく
Domain Authenticationの設定もする
```
<br>
<br>

- ActionMailboxの処理の流れ  
```
1.リクエストの認証を行い、パスワードが正しいものであるかを判別する
2.InboundEmailモデルのレコードを作る
3.2と同時にメールデータをActiveStorage経由で保存する
4.ActiveJobを利用し、受信メールに対しての処理を非同期処理バックエンドのキューに登録する
5.メールサービスにレスポンスを返す
```
<br>
<br>

- 