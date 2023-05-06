## Action Text  
<br>

- Action Text  
```
リッチテキストを編集するためのエディタと、
リッチテキストを保存するためのDBを簡単に用意できる
bin/rails g scaffold message content:rich_textとすると簡単にActionTextを実装できる

```
<br>

- リッチテキストとは  
```
文書内に図形や表を埋め込むことができる
Wordなどのワープロソフトにおいて標準的な文書ファイルとされる
拡張子は「.rtf」
対になるものにプレーンテキスト(文字だけの文書)がある
```
<br>
<br>

- ActionTextをインストール
```
bin/rails action_text:install
ActiveStorageでの画像変換処理で必要なライブラリをインストール
gem image_processing
ImageMagick
```  
<br>
<br>

- 任意のモデルにリッチテキストを属性として持たせる  
```rb
#app/models/message.rb
#has_rich_text :contentを記述
class Message < ApplicationRecord
  has_rich_text :content
end
```
<br>
<br>

- Viewでrich_text_areaヘルパーを利用する  
```
app/views/messages/_form.html.erb

<div class="field">
  <%= form.label :content %>
  <%= form.rich_text_area :content %>
<div>
<div class="actions">
  <%= form.submit %>
</div>
```
<br>
<br>

- StrongParameterでcontent属性を許可する  
```rb
#app/controllers/messages_controller.rb
def message_params
  params.require(:message).permit(:content)
end
```
<br>
<br>

- 保存したリッチテキストを表示する  
```
app/views/messages/show.html.erb
<%= @message.content %>
```
<br>
<br>

- ActionText使用時はN+1問題に注意  
```
リッチテキストのデータは紐づけられたモデルとは別のモデルで管理されている(ActionText::RichText)
message.contentは一見messageモデルのカラムのようで違うので、eager loadをしていないと都度クエリを発行してしまう
さらに画像付きだった場合AcitiveStorageへのアクセスも発生するのでクエリ回数が増える
この問題を回避するActionText専用のeager load用のメソッドがある
with_rich_text_#{name}
with_rich_text_#{name}_and_embeds
nameの箇所はhas_rich_textへ渡した引数になる(今回だとcontent)
```
<br>

```rb
#app/controllers/messages_controller.rb
def index
  @messages = Message.with_rich_text_content
end
```