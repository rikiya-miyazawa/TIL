## Active Job  
<br>

- Active Jobによる非同期実行  
```
Active Jobは非同期実行処理機能を提供するライブラリ

```
<br>
<br>

- ジョブ  
```
ジョブクラスを生成する
% bin/rails g job async_log
```
<br>

```rb
#app/jobs/async_log_job.rb
#非同期通信処理時に呼ばれるperformメソッドが用意されている
#performメソッドにジョブで実行したい処理を実装する
#今回はmessageを引数で受け取り、それをAsyncLogモデルを使ってDBに保存するジョブを作る
class AsyncLogJob < ApplicationJob
  queue_as :default

  def perform(message: "hello")  
    AsyncLog.create!(message: message)
  end
end
```
<br>
<br>

- キューとはjobを実行するための順番待ちみたいなもの(先入先出)  
<br>

- perfomr_laterメソッド  
```
バックエンドにキューを追加し、非同期実行する
```