## Action Cable  
<br>

- Action Cable  
```
WebSocketを使ったリアルタイム処理を提供するライブラリ
WebSocketはクライアント/サーバ間のコネクションを維持し、双方向でデータをやり取りするための通信規格

```
<br>
<br>

- Action Cable使用の準備  
```
ActionCable用のファイルを生成するため、generateのchannelサブコマンドを利用する
bin/rails g channel room speak
```
<br>

- 生成されたチャネルのサーバーサイドファイル  
```rb
#WebSocket処理におけるコントローラーのような役割
class RoomChannel < ApplicationCable::Channel
  #クライアントはWebSocket通信を通じてチャネルと関連付けされる
  #その関連のことを「subscription(購読)」と呼ぶ
  #購読は一度に複数のチャネルに対して作ることができる
  def subscribed
    #購読後に「subscribed」メソッドが呼ばれる
    # stream_from "some_channel"
  end

  def unsubscribed
    #購読解除後に「unsubscribed」メソッドが呼ばれる
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
    #クライアントから呼び出された時「speak」メソッドが呼ばれる
  end
end
```