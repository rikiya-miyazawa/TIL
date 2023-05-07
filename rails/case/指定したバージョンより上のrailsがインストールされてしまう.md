## 指定したRailsより上のバージョンがインストールされてしまう問題  
<br>

- rails _6.0.3_ new してもrails -v で6.0.6.1になってしまう  
```
Gemファイルの記載に原因あり

まずはGemfileを読み込まずにRails newする
rails _6.0.3_ new アプリ名 -d DB名 --skip-bundle
gem 'rails', '~> 6.0.3'をgem 'rails', '= 6.0.3'へ(~>を消す)
rm -rf Gemfile.lockでGemfile.lockを削除する
実行 bundle install
rails -v 6.0.3になってる
```