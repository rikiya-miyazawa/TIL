## ActiveStorage  
<br>

- ActiveStorage  
```
写真を撮って他者と共有するなど、ファイルアップロードの需要は時代とともに高まっている
今まではRailsでファイルアップロード機能を実装するためにはCarrierWaveなどのgemが必要だったが、
Rails5.2からRails公式のファイルアップロード機能が加わった
それがActiveStorage
```
<br>
<br>

- ActiveStorage用の属性を追加  
```
portraitという名前のActiveStorageを追加
portrait:attachment
db/schemaにはportraitはカラムとして記載されていないが、別テーブルとして管理されている
めっちゃ簡単にファイルアップロード機能を追加できる！
```
<br>

```rb
#app/models/user.rb
#portrait:attachmentに関する設定が記述されている
#UserとBlobを1対1で関連づけるという宣言
#1対多にする場合はhas_manyにする
class User < ApplicationRecord
  has_one_attached :portrait
end
```
<br>
<br>

- ActiveStorageの機能は主に２つのモデルで作られている  
```
ActiveStorage::Attachment
ActiveStorage::Blob
どのモデルに紐づけられた画像もこの二つを利用する

ActiveStorage::Attachmentは主となるモデルとBlobとの中間テーブルに相当するモデル
ActiveStorage::Blobはアップロードファイルのメタ情報を管理するモデル
```
<br>

- サムネイルを生成する  
```
#app/views/users/show.html.erb
この記述を変更する
#デフォルト
<p>
  <strong>Portrait:</strong>
  <%= link_to @user.portrait.filename, @user.portrait if @user.portrait.attached? %>
</p>
link_to @user.portrait.filename, @user.portrait if @user.portrait.attached?

#100 * 100サイズのサムネイルを生成する
<p>
  <strong>Portrait:</strong>
  <%= image_tag @user.portrait.variant(resize_to_limit:[100, 100]) %>
</p>

ImageProcessingはlibvipsというライブラリもサポートしている
ImageMagicほど多彩なことはできないが、メモリ消費量が少なく実行速度が速い
使う場合はbrew install vipsなどでインストールしconfig/application.rbファイルで設定する
```
<br>
<br>

- ファイルへのアクセス制限  
```
ActiveStorageを利用した場合、サーバは期限付きのURLを作成しそこにリダイレクトする
期限はデフォルトで5分間
```
<br>
<br>

- ダイレクトアップロード機能  
```
アプリケーションサーバを経由せずに、ファイルを直接クラウドにアップロードできる
アップロードにかかる時間を短縮し、アプリケーションサーバへの負担も減らせる

#direct_upload: trueを追加
#複数ファイルを同時にダイレクトアップロードしたい場合はさらにmultiple: trueも追加する
<div class="field">
  <%= form.label :portrait %>
  <%= form.file_field :portrait, direct_upload: true %>
</div>
```
<br>
<br>

- ActiveStorageの問題点  
```
バルデーションヘルパーの不足
ActiveStorageはバリデーションに手間がかかる
cacheの不足
ActiveStorageの利用者も増えているので今後改善されるのが期待できる
```