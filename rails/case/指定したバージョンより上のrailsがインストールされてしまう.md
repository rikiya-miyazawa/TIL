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
<br>

```js
//package.json
{
  "name": "awesome_events",
  "private": true,
  "dependencies": {
    "@rails/activestorage": "^6.0.0",
    "@rails/ujs": "^6.0.0",
    "@rails/webpacker": "5.4.3", //ここに記載
    "node-sass": "^8.0.0",
    "turbolinks": "^5.2.0"
  },
  "version": "0.1.0",
  "devDependencies": {
    "webpack-dev-server": "^4.14.0"
  }
}
```