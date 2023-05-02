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
```
<br>

```rb
#app/models/user.rb
#portrait:attachmentに関する設定が記述されている
class User < ApplicationRecord
  has_one_attached :portrait
end
```