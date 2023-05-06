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
    #接続しているクライアントへメッセージを送る時、このストリーム名を利用する
    steam_from "room_channel"
  end

  def unsubscribed
    #購読解除後に「unsubscribed」メソッドが呼ばれる
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    #クライアントから呼び出された時「speak」メソッドが呼ばれる
    #クライアントがチャットメッセージを送信した時にサーバサイド側で実行されるメソッド
    ActionCable.server.broadcast(
      "room_channel", { message: data["message"] }
    )
  end
end
```
<br>

- クライアントサイドのファイル  
```js
//app/javascript/channels/room_channel.js
//サーバサイドのRoomChannelを購読するための処理が書かれている
consumer.subscriptions.create("RoomChannel", {
  connected() {
    //接続時
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    //切断時
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    //サーバからのデータを受信した時
    //受け取ったデータをalertで表示する
    alert(data['message']);
  },

  speak: function(message) {
    //購読しているチャネルであるRoomChannelクラスのspeakメソッドをWebSocket通信経由で呼び出す
    //performメソッドを使ってメッセージを送信する
    return this.perform('speak', {message: message});
  }
});
```