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