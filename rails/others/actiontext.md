## Action Text  
<br>

- Action Text  
```
リッチテキストを編集するためのエディタと、
リッチテキストを保存するためのDBを簡単に用意できる
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