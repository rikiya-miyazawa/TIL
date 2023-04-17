## url_for  
<br>

- url_forはWebアプリケーションのパスを構築するためのヘルパーメソッド  
```rb
#文字列を直接書かずにルーティング上の定義を活用できる
url_for(edit_profile_path)
#=> /profile/edit


#コントローラとアクション名を指定してパラメータから適切なパスを選択して出力する
url_for(controller: :profiles, action: :edit)
#=> /profile/edit

#特定のオプション以外のパラメータを追加することもできる
url_for(controller: :profiles, action: :edit, id: 1234, detailed: 'true')
#=> /profile/edit?detailed=true&id=1234
```