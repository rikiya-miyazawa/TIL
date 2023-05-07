## 指定したRailsより上のバージョンがインストールされてしまう問題  
<br>

- rails _6.0.3_ new してもrails -v で6.0.6.1になってしまう  
```
Gemファイルの記載に原因あり
gem 'rails', '~> 6.0.3'をgem 'rails', '6.0.3'へ(~>を消す)
Gemfile.lockを削除する
実行 bundle lock --add-platform x86_64-linux
実行 bundle install
rails -v 6.0.3になってる
```