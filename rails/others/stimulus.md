## stimulus  
<br>

- stimulus  
```
控えめなJSフレームワーク
Turbolinksと併用可能
Railsに標準で組み込まれているライブラリではない
Railsを開発したDHHが所属しているBasecamp社で開発を進めている
Stimulusはフロントエンドに対して規約をもたらすためのフレームワーク
ReactやVueとは違い、「サーバからJSONを受け取ってフロントエンド側でHTMLを生成する」ようなことはしない
あくまでHTMLはサーバから返すものであるという姿勢
ロジックがサーバサイド寄りになる
フロント開発の幅が狭まるというメリットはあるが、専任のフロントエンド人材がいない場合の開発で効率的にフロント開発ができる
```

- RailsプロジェクトにStimulusを組み込む方法  
```
Webpackerを利用している場合
% bin/rails webpacker:install:stimulus
```