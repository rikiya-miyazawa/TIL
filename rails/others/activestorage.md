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

- 