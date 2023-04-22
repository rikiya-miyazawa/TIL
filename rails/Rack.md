## Rack  
<br>

- Rackとは  
```
WebアプリケーションサーバとWebアプリケーションフレームワーク間のインターフェイスを共通化した仕様であり実装となっているライブラリ。
Rackを仲介することで、UnicornやPumaといったアプリケーションサーバとフレームワーク間でスムーズなやりとりが行えるようになっている。
```
<br>
<br>

- Rackを動かすにはgem rackをインストールする  
`gem install rack`  
<br>
<br>

- Rackが利用するエントリーポイント用の一般的なファイル名  
`config.ru`  
<br>
<br>

- Rackのミドルウェアを使用する  
```rb
#useメソッドを使用する
use Rack::Runtime
```
<br>
<br>

- Railsで使用しているRackミドルウェアの確認方法  
`bin/rails middleware`
<br>
<br>

